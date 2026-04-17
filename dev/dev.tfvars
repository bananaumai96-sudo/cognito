# --- S3バケット作成で使用 ---
bucket_name = "api-lambda-test-0001"

# --- Lambda関数で使用 ---
#--- lambda_function ---
name     = "api-lambda"
handler  = "app.lambda_handler"
runtime  = "python3.12"
filename = "app.zip"


# --- lambda_permission ---
lambda_action    = "lambda:InvokeFunction"
lambda_principal = "apigateway.amazonaws.com"


# --- APIで使用 ---
# --- api ---
api_protocol = "HTTP"
api_route = [
  "GET /hello",
  "POST /hello",
  "OPTIONS /hello",
  "POST /users",
  "GET /users"
]
api_allow_origins = ["https://d7vo1194b0w.cloudfront.net"]
api_allow_methods = ["GET", "POST", "OPTIONS"]
api_allow_headers = ["Content-Type", "Authorization"]

# --- integration ---
api_integration_type       = "AWS_PROXY"
api_integration_method     = "POST"
api_payload_format_version = "2.0"

# --- DynamoDBで使用 ---
db_billing_mode        = "PAY_PER_REQUEST"
db_hash_key            = "users_id"
db_key_type            = "S"
db_gsi_hash_key        = "email"
db_gsi_key_type        = "S"
db_gsi_name            = "email-index"
db_gsi_projection_type = "ALL"

# --- Cognitoで使用 ---
# --- user_pool ---
auto_verified_attributes   = ["email"]
schema_name                = "email"
schema_attribute_data_type = "String"
schema_required            = true
schema_mutable             = true

# --- user_pool_client ---
generate_secret                      = false
allowed_oauth_flows                  = ["code"]
allowed_oauth_scopes                 = ["email", "openid", "profile"]
allowed_oauth_flows_user_pool_client = true
callback_urls                        = ["https://d7vo1194b0w.cloudfront.net"]
logout_urls                          = ["https://d7vo1194b0w.cloudfront.net/login.html"]
supported_identity_providers         = ["COGNITO"]

# --- user_pool_domain ---
user_pool_domain = "my-sample-auth-domain-12345"

# --- cognito_user ---
attributes_email_verified = "true"

# --- Cloudfront ---
origin_id                         = "s3-origin"
target_origin_id                  = "s3-origin"
viewer_protocol_policy            = "redirect-to-https"
allowed_methods                   = ["GET", "HEAD"]
cached_methods                    = ["GET", "HEAD"]
restriction_type                  = "none"
cloudfront_default_certificate    = true
oac_name                          = "s3-oac"
oac_description                   = "OAC for S3"
origin_access_control_origin_type = "s3"
signing_behavior                  = "always"
signing_protocol                  = "sigv4"
