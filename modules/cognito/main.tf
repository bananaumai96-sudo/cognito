resource "aws_cognito_user_pool" "main" {
  name = "user-pool"

  auto_verified_attributes = ["email"]

  schema {
    name     = "email"
    attribute_data_type = "String"
    required = true
    mutable  = true
  }
}

resource "aws_cognito_user_pool_client" "client" {
  name         = "client"
  user_pool_id = aws_cognito_user_pool.main.id

  generate_secret = false

  allowed_oauth_flows = ["implicit"]
  allowed_oauth_scopes = ["email", "openid", "profile"]
  allowed_oauth_flows_user_pool_client = true

  callback_urls = ["https://d7vo1194b0w.cloudfront.net"]
  logout_urls   = ["https://d7vo1194b0w.cloudfront.net/login.html"]

  supported_identity_providers = ["COGNITO"]
}

resource "aws_cognito_user_pool_domain" "domain" {
  domain       = "my-sample-auth-domain-12345" # ←一意にする
  user_pool_id = aws_cognito_user_pool.main.id
}

resource "aws_cognito_user" "test_user" {
  user_pool_id = aws_cognito_user_pool.main.id
  username     = "test@example.com"

  attributes = {
    email = "test@example.com"
    email_verified = "true"
  }

  temporary_password = "TempPass123!"
}
