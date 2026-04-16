output "userpool_main_id" {
  description = "userpool_main_id"
  value       = aws_cognito_user_pool.main.id
}
output "userpool_client_id" {
  description = "userpool_client_id"
  value       = aws_cognito_user_pool_client.client.id
}
