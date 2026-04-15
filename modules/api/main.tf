resource "aws_apigatewayv2_api" "api" {
  name          = "serverless-http-api"
  protocol_type = var.modules_api_protocol
  cors_configuration {
  allow_origins = var.modules_api_allow_origins
  allow_methods = var.modules_api_allow_methods
  allow_headers = var.modules_api_allow_headers
}

}

resource "aws_apigatewayv2_route" "get" {
for_each = toset(var.modules_api_route)
  api_id    = aws_apigatewayv2_api.api.id
  route_key = each.value
  target    = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.api.id
  name        = "$default"
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "lambda" {
  api_id                 = aws_apigatewayv2_api.api.id
  integration_type       = var.modules_integration_type
  integration_uri        = var.modules_integration_uri
  integration_method     = var.modules_integration_method
  payload_format_version = var.modules_payload_format_version
}

resource "aws_apigatewayv2_authorizer" "cognito_auth" {
  name = "cognito-authorizer"
  api_id = aws_apigatewayv2_api.api.id
  authorizer_type = "JWT"

  identity_sources = ["$request.header.Authorization"]

  jwt_configuration {
    issuer   = var.modules_api_cognito_issuer
    audience = [var.modules_api_cognito_audience]
  }
}

resource "aws_apigatewayv2_route" "secured" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /secure"

  target = "integrations/${aws_apigatewayv2_integration.lambda.id}"

  authorizer_id = aws_apigatewayv2_authorizer.cognito_auth.id
  authorization_type = "JWT"
}