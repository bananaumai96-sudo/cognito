resource "aws_cognito_user_pool" "main" {
  name = "user-pool"

  auto_verified_attributes = var.modules_auto_verified_attributes


  schema {
    name     = var.modules_schema_name
    attribute_data_type = var.modules_schema_attribute_data_type
    required = var.modules_schema_required
    mutable  = var.modules_schema_mutable
  }

}

resource "aws_cognito_user_pool_client" "client" {
  name         = "client"
  user_pool_id = aws_cognito_user_pool.main.id

  generate_secret = var.modules_generate_secret

  allowed_oauth_flows = var.modules_allowed_oauth_flows
  allowed_oauth_scopes = var.modules_allowed_oauth_scopes
  allowed_oauth_flows_user_pool_client = var.modules_allowed_oauth_flows_user_pool_client

  callback_urls = var.modules_callback_urls
  logout_urls   = var.modules_logout_urls

  supported_identity_providers = var.modules_supported_identity_providers
}

resource "aws_cognito_user_pool_domain" "domain" {
  domain       = var.modules_user_pool_domain # ←一意にする
  user_pool_id = aws_cognito_user_pool.main.id
}

resource "aws_cognito_user" "test_user" {
  user_pool_id = aws_cognito_user_pool.main.id
  username     = var.modules_username

  attributes = {
    email = var.modules_attributes_email
    email_verified = var.modules_attributes_email_verified
  }

  temporary_password = var.modules_temporary_password
}
