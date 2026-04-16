variable "modules_s3_bucket_domain_name" {
    description = "s3_bucket_domain_name"
    type = string
}

variable "modules_origin_id" {
    description = "origin_id"
    type = string
}

variable "modules_target_origin_id" {
    description = "target_origin_id"
    type = string
}

variable "modules_viewer_protocol_policy" {
    description = "viewer_protocol_policy"
    type = string
}

variable "modules_allowed_methods" {
    description = "allowed_methods"
    type = list(string)
}

variable "modules_cached_methods" {
    description = "cached_methods"
    type = list(string)
}

variable "modules_restriction_type" {
    description = "restriction_type"
    type = string
}

variable "modules_cloudfront_default_certificate" {
    description = "cloudfront_default_certificate"
    type = bool
}

variable "modules_oac_name" {
    description = "oac_name"
    type = string
}

variable "modules_oac_description" {
    description = "oac_description"
    type = string
}

variable "modules_origin_access_control_origin_type" {
    description = "origin_access_control_origin_type"
    type = string
}

variable "modules_signing_behavior" {
    description = "signing_behavior"
    type = string
}

variable "modules_signing_protocol" {
    description = "signing_protocol"
    type = string
}
