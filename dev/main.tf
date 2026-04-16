# --- Lambda関数作成 ---
module "lambda" {
  source                       = "../modules/lambda"
  #--- lambda_function ---
  modules_name                 = var.name
  modules_handler              = var.handler
  modules_runtime              = var.runtime
  modules_filename             = var.filename

  # --- role ---
  modules_lambda_policy_arn    = var.policy_arn
  modules_lambda_db_policy_arn = var.db_policy_arn

  # --- lambda_permission ---
  modules_lambda_action        = var.lambda_action
  modules_lambda_principal     = var.lambda_principal
}

# --- S3作成 ---
module "s3" {
  source         = "../modules/s3"
  s3_bucket_name = var.bucket_name
  modules_cloudfornt_distribution_arn = module.cloudfront.distribution_site_arn
}

# --- API Gateway作成 ---
module "api" {
  source                         = "../modules/api"
  # --- api ---
  modules_api_protocol           = var.api_protocol
  modules_api_route              = var.api_route
  modules_integration_uri        = module.lambda.lamubda_function_invoke
  modules_api_allow_origins      = var.api_allow_origins
  modules_api_allow_headers      = var.api_allow_headers
  modules_api_allow_methods      = var.api_allow_methods

  # --- integration ---
  modules_integration_type       = var.api_integration_type
  modules_integration_method     = var.api_integration_method
  modules_payload_format_version = var.api_payload_format_version

  # --- cognito用route ---
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

# --- Cognito作成 ---
module "cognito" {
  source = "../modules/cognito"
  # --- user_pool ---
  modules_auto_verified_attributes = var.auto_verified_attributes
  modules_schema_attribute_data_type = var.schema_attribute_data_type
  modules_schema_name = var.schema_name
  modules_schema_required = var.schema_required
  modules_schema_mutable = var.schema_mutable

  # --- user_pool_client ---
  modules_generate_secret = var.generate_secret
  modules_allowed_oauth_flows = var.allowed_oauth_flows
  modules_allowed_oauth_scopes = var.allowed_oauth_scopes
  modules_allowed_oauth_flows_user_pool_client = var.allowed_oauth_flows_user_pool_client
  modules_callback_urls = var.callback_urls
  modules_logout_urls = var.logout_urls
  modules_supported_identity_providers = var.supported_identity_providers

  # --- user_pool_domain ---
  modules_user_pool_domain = var.user_pool_domain

  # --- cognito_user ---
  modules_username = var.username
  modules_attributes_email = var.attributes_email
  modules_attributes_email_verified = var.attributes_email_verified
  modules_temporary_password = var.temporary_password
}

# --- CloudFront作成 ---
module "cloudfront" {
  source = "../modules/cloudfront"
  modules_s3_bucket_domain_name = module.s3.regional_domain_name
  modules_origin_id = var.origin_id
  modules_target_origin_id = var.target_origin_id
  modules_viewer_protocol_policy = var.viewer_protocol_policy
  modules_allowed_methods = var.allowed_methods
  modules_cached_methods = var.cached_methods
  modules_restriction_type = var.restriction_type
  modules_cloudfront_default_certificate = var.cloudfront_default_certificate
  modules_oac_name = var.oac_name
  modules_oac_description = var.oac_description
  modules_origin_access_control_origin_type = var.origin_access_control_origin_type
  modules_signing_behavior = var.signing_behavior
  modules_signing_protocol = var.signing_protocol

}

