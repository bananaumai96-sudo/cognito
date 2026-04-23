variable "modules_api_protocol" {
  description = "protocol"
  type        = string
}

variable "modules_api_route" {
  description = "aip_route"
  type        = list(string)
}

variable "modules_api_allow_origins" {
  description = "allow_origins"
  type        = list(string)
}

variable "modules_api_allow_methods" {
  description = "allow_methods"
  type        = list(string)
}

variable "modules_api_allow_headers" {
  description = "allow_headers"
  type        = list(string)
}

variable "modules_integration_uri" {
  description = "integration_uri"
  type        = string
}

variable "modules_integration_type" {
  description = "integration_type"
  type        = string
}

variable "modules_integration_method" {
  description = "integration_method"
  type        = string
}

variable "modules_payload_format_version" {
  description = "payload_format_version"
  type        = string
}

variable "modules_api_cognito_issuer" {
  description = "cognito_issuer"
  type        = string
}

variable "modules_api_cognito_audience" {
  description = "cognito_audience"
  type        = string
}

variable "modules_api_secure_route" {
  description = "aip_secure_route"
  type        = list(string)
}