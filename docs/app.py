import json
import boto3
import uuid
from boto3.dynamodb.conditions import Key
import urllib.parse
import urllib.request
import traceback

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table("users")

COGNITO_DOMAIN = "https://my-sample-auth-domain-12345.auth.ap-northeast-1.amazoncognito.com"
CLIENT_ID = "51r5lv57lkjr5m53c4m1rr5gmc"
REDIRECT_URI = "https://d3ca0c4sh5rria.cloudfront.net"

def lambda_handler(event, context):
    method = event.get("requestContext", {}).get("http", {}).get("method")
    path = event["rawPath"]


    if method == "OPTIONS":
        return response(200, "")
    elif method == "POST" and path == "/hello":
        return create_users(event)
    elif method == "GET" and path == "/hello":
        return get_users(event)
    elif method == "POST" and path == "/users":
        return creates_users(event)
    elif method == "GET" and path == "/users":
        return gets_users(event)
    elif method == "GET" and path == "/secure":
        claims = event["requestContext"]["authorizer"]["claims"]
        user_id = claims["sub"]
        return response(200,{"user_id": user_id})
    elif method == "POST" and path == "/token":
        return create_token(event)
    else:
        return response(400, {"error": "条件一致無し"})
    
def get_users(event):
    try:
        params = event.get("queryStringParameters") or {}
        user_id = params.get("id")

        res = table.get_item(Key={"users_id": user_id})
        item = res.get("Item")

        if not item:
            return response(404, {"error": "userIDが見つかりません"})
        
        return response(200, {"saved": f'検索結果：{item["name"]}'})

    except Exception as e:
        return response(400, {"error": str(e)})

def gets_users(event):
    try:
        params = event.get("queryStringParameters") or {}
        email = params.get("email")
        
        items = get_db(email)

        if not items:
            return response(200, items)
        
        return response(200, items)

    except Exception as e:
        return response(400, {"error": str(e)})
         
def create_users(event):
   try:
       body_str = event.get("body") or {}
       body = json.loads(body_str)
       name = body.get("name")
       # 🔥 DynamoDB保存
       table.put_item(
           Item={
               "users_id": str(uuid.uuid4()),
               "name": name
           }
       )
       return response(200, {"saved": f"登録完了：{name}"})

   except Exception as e:
       return response(400, {"error": str(e)})

def creates_users(event):
    try:
        body = json.loads(event.get("body") or {})
        name = body.get("name")
        department = body.get("department")
        email = body.get("email")

        items = get_db(email)
        if items:
            return response(400, {"error": "エラー：登録済みメール"})
        
        table.put_item(
            Item={
                "users_id": str(uuid.uuid4()),
                "name": name,
                "department": department,
                "email": email
            }
        )
        return response(200, {"saved": "登録完了"})

    except Exception as e:
        return response(400, {"error": str(e)})

def create_token(event):
    try:
        body = json.loads(event.get("body", "{}"))
        code = body.get("code")
        code_verifier = body.get("code_verifier")

        if not code:
            return response(400, {"error": "code is required"})

        data = urllib.parse.urlencode({
            "grant_type": "authorization_code",
            "client_id": CLIENT_ID,
            "code": code,
            "redirect_uri": REDIRECT_URI,
            "code_verifier": code_verifier
        }).encode("utf-8")

        req = urllib.request.Request(
            f"{COGNITO_DOMAIN}/oauth2/token",
            data=data,
            headers={"Content-Type": "application/x-www-form-urlencoded"},
            method="POST"
        )

        with urllib.request.urlopen(req) as res:
            result = json.loads(res.read().decode("utf-8"))
            return response(200, result)

    except Exception as e:
        print("ERROR OCCURED")
        print(traceback.format_exc())

        return response(500, {
            "error": str(e)
        })

def response(status, body):
    return {
        "statusCode": status,
        "headers": {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*"
        },
        "body": json.dumps(body)
    }

def get_db(email):
    res = table.query(
        IndexName="email-index",
        KeyConditionExpression=Key("email").eq(email),
    )
    return res.get("Items",[])
