resource "aws_lambda_function" "lambda" {
  function_name    = var.modules_name
  role             = aws_iam_role.lambda_common_role.arn
  handler          = var.modules_handler
  runtime          = var.modules_runtime
  filename         = var.modules_filename
  source_code_hash = filebase64sha256("${var.modules_filename}")
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = var.modules_lambda_action
  function_name = aws_lambda_function.lambda.function_name
  principal     = var.modules_lambda_principal
}
