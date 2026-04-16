output "regional_domain_name" {
  description = "regional_domain_name"
  value       = aws_s3_bucket.create.bucket_regional_domain_name
}