# --- Lambda関数作成 ---
module "lambda" {
  source                       = "../modules/lambda"
  modules_name                 = var.name
  modules_handler              = var.handler
  modules_runtime              = var.runtime
  modules_filename             = var.filename
  modules_lambda_policy_arn    = var.policy_arn
  modules_lambda_db_policy_arn = var.db_policy_arn
  modules_lambda_action        = var.lambda_action
  modules_lambda_principal     = var.lambda_principal
}

# --- S3作成 ---
module "s3" {
  source         = "../modules/s3"
  s3_bucket_name = var.bucket_name
}

# --- API Gateway作成 ---
module "api" {
  source                         = "../modules/api"
  modules_api_protocol           = var.api_protocol
  modules_api_route              = var.api_route
  modules_integration_uri        = module.lambda.lamubda_function_invoke
  modules_api_allow_origins      = var.api_allow_origins
  modules_api_allow_headers      = var.api_allow_headers
  modules_api_allow_methods      = var.api_allow_methods
  modules_integration_type       = var.api_integration_type
  modules_integration_method     = var.api_integration_method
  modules_payload_format_version = var.api_payload_format_version
  modules_api_cognito_issuer = "https://cognito-idp.ap-northeast-1.amazonaws.com/${module.cognito.userpool_main_id}"
  modules_api_cognito_audience = module.cognito.userpool_client_id
}

# --- DynaoDB作成 ---
module "DynamoDB" {
  source                         = "../modules/dynamodb"
  modules_db_billing_mode        = var.db_billing_mode
  modules_db_hash_key            = var.db_hash_key
  modules_db_key_type            = var.db_key_type
  modules_db_gsi_hash_key        = var.db_gsi_hash_key
  modules_db_gsi_key_type        = var.db_gsi_key_type
  modules_db_gsi_name            = var.db_gsi_name
  modules_db_gsi_projection_type = var.db_gsi_projection_type
}

# --- DynaoDB作成 ---
module "cognito" {
  source = "../modules/cognito"
}