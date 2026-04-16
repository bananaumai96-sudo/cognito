# --- Lambda関数で使用 ---
variable "name" {
  description = "関数名"
  type        = string
}

variable "handler" {
  description = "LambdaHandler"
  type        = string
}

variable "runtime" {
  description = "ランタイム"
  type        = string
}

variable "filename" {
  description = "コードのファイル名(zipファイル)"
  type        = string
}

variable "lambda_action" {
  description = "lambda_action"
  type        = string
}

variable "lambda_principal" {
  description = "lambdaのロール用principal"
  type        = string
}


# --- ロール作成で使用 ---
variable "policy_arn" {
  description = "ロールARN"
  type        = string
}

variable "db_policy_arn" {
  description = "db用ポリシーARN"
  type        = string

}
# --- S3バケット作成で使用 ---
variable "bucket_name" {
  description = "s3バケット名"
  type        = string
}


# --- AIPで使用 ---
variable "api_protocol" {
  description = "api_protocol"
  type        = string
}

variable "api_route" {
  description = "api_route"
  type        = list(string)
}

variable "api_allow_origins" {
  description = "allow_origins"
  type        = list(string)
}

variable "api_allow_methods" {
  description = "allow_methods"
  type        = list(string)
}

variable "api_allow_headers" {
  description = "allow_headers"
  type        = list(string)
}

variable "api_integration_type" {
  description = "integration_type"
  type        = string
}

variable "api_integration_method" {
  description = "integration_method"
  type        = string
}

variable "api_payload_format_version" {
  description = "payload_format_version"
  type        = string
}



# --- DynamoDBで使用 ---
variable "db_billing_mode" {
  description = "billing_mode"
  type        = string
}

variable "db_hash_key" {
  description = "hash_key"
  type        = string
}

variable "db_key_type" {
  description = "key_type"
  type        = string
}

variable "db_gsi_hash_key" {
  description = "gsi_hash_key"
  type        = string
}

variable "db_gsi_key_type" {
  description = "gsi_key_type"
  type        = string
}

variable "db_gsi_name" {
  description = "gsi_name"
  type        = string
}

variable "db_gsi_projection_type" {
  description = "gsi_projection_type"
  type        = string
}

# --- Cognitoで使用 ---
# --- user pool ---
variable "auto_verified_attributes" {
    description = "auto_verified_attributes"
    type = list(string)
}

variable "schema_name" {
    description = "name"
    type = string
}


variable "schema_attribute_data_type" {
    description = "attribute_data_type"
    type = string
}


variable "schema_required" {
    description = "required"
    type = bool
}


variable "schema_mutable" {
    description = "mutable"
    type = bool
}

# --- user_pool_client ---
variable "generate_secret" {
    description = "generate_secret"
    type = bool
}

variable "allowed_oauth_flows" {
    description = "allowed_oauth_flows"
    type = list(string)
}

variable "allowed_oauth_scopes" {
    description = "allowed_oauth_scopes"
    type = list(string)
}

variable "allowed_oauth_flows_user_pool_client" {
    description = "allowed_oauth_flows_user_pool_client"
    type = bool
}

variable "callback_urls" {
    description = "callback_urls"
    type = list(string)
}

variable "logout_urls" {
    description = "logout_urls"
    type = list(string)
}

variable "supported_identity_providers" {
    description = "supported_identity_providers"
    type = list(string)
}

# --- user_pool_domain ---
variable "user_pool_domain" {
    description = "user_pool_domain"
    type = string
}

# --- cognito_user ---
variable "username" {
    description = "username"
    type = string
}

variable "attributes_email" {
    description = "attributes_email"
    type = string
}

variable "attributes_email_verified" {
    description = "attributes_email_verified"
    type = string
}

variable "temporary_password" {
    description = "temporary_password"
    type = string
}

# --- CloudFront ---
variable "origin_id" {
    description = "origin_id"
    type = string
}

variable "target_origin_id" {
    description = "target_origin_id"
    type = string
}

variable "viewer_protocol_policy" {
    description = "viewer_protocol_policy"
    type = string
}

variable "allowed_methods" {
    description = "allowed_methods"
    type = list(string)
}

variable "cached_methods" {
    description = "cached_methods"
    type = list(string)
}

variable "restriction_type" {
    description = "restriction_type"
    type = string
}

variable "cloudfront_default_certificate" {
    description = "cloudfront_default_certificate"
    type = bool
}

variable "oac_name" {
    description = "oac_name"
    type = string
}

variable "oac_description" {
    description = "oac_description"
    type = string
}

variable "origin_access_control_origin_type" {
    description = "origin_access_control_origin_type"
    type = string
}

variable "signing_behavior" {
    description = "signing_behavior"
    type = string
}

variable "signing_protocol" {
    description = "signing_protocol"
    type = string
}
