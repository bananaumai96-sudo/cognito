resource "aws_cloudfront_distribution" "site" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name              = var.modules_s3_bucket_domain_name
    origin_id                = var.modules_origin_id
    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
  }

  default_cache_behavior {
    target_origin_id       = var.modules_target_origin_id
    viewer_protocol_policy = var.modules_viewer_protocol_policy

    allowed_methods = var.modules_allowed_methods
    cached_methods  = var.modules_cached_methods

    cache_policy_id = data.aws_cloudfront_cache_policy.caching_optimized.id
  }

  restrictions {
    geo_restriction {
      restriction_type = var.modules_restriction_type
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = var.modules_cloudfront_default_certificate
  }
}

resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = var.modules_oac_name
  description                       = var.modules_oac_description
  origin_access_control_origin_type = var.modules_origin_access_control_origin_type
  signing_behavior                  = var.modules_signing_behavior
  signing_protocol                  = var.modules_signing_protocol
}
