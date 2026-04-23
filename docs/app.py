import json
import boto3
import uuid
from boto3.dynamodb.conditions import Key

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table("users")

def lambda_handler(event, context):
    method = event.get("requestContext", {}).get("http", {}).get("method")
    path = event["rawPath"]
    claims = event["requestContext"]["authorizer"]["claims"]
    user_id = claims["sub"]

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
        return response(200,user_id)
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
