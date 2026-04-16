# --- user pool ---
variable "modules_auto_verified_attributes" {
    description = "auto_verified_attributes"
    type = list(string)
}

variable "modules_schema_name" {
    description = "name"
    type = string
}


variable "modules_schema_attribute_data_type" {
    description = "attribute_data_type"
    type = string
}


variable "modules_schema_required" {
    description = "required"
    type = bool
}


variable "modules_schema_mutable" {
    description = "mutable"
    type = bool
}

# --- user_pool_client ---
variable "modules_generate_secret" {
    description = "generate_secret"
    type = bool
}

variable "modules_allowed_oauth_flows" {
    description = "allowed_oauth_flows"
    type = list(string)
}

variable "modules_allowed_oauth_scopes" {
    description = "allowed_oauth_scopes"
    type = list(string)
}

variable "modules_allowed_oauth_flows_user_pool_client" {
    description = "allowed_oauth_flows_user_pool_client"
    type = bool
}

variable "modules_callback_urls" {
    description = "callback_urls"
    type = list(string)
}

variable "modules_logout_urls" {
    description = "logout_urls"
    type = list(string)
}

variable "modules_supported_identity_providers" {
    description = "supported_identity_providers"
    type = list(string)
}

# --- user_pool_domain ---
variable "modules_user_pool_domain" {
    description = "user_pool_domain"
    type = string
}

# --- cognito_user ---
variable "modules_username" {
    description = "username"
    type = string
}

variable "modules_attributes_email" {
    description = "attributes_email"
    type = string
}

variable "modules_attributes_email_verified" {
    description = "attributes_email_verified"
    type = string
}

variable "modules_temporary_password" {
    description = "temporary_password"
    type = string
}
