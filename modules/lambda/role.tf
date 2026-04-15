# --- Lambda用ロール作成 ---
# ポリシーのARNを指定
# ポリシーは別途用意
resource "aws_iam_role" "lambda_common_role" {
  name = "lambda-common-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}


resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_common_role.name
  policy_arn = var.modules_lambda_policy_arn
}

resource "aws_iam_role_policy_attachment" "lambda_db_policy" {
  role       = aws_iam_role.lambda_common_role.name
  policy_arn = var.modules_lambda_db_policy_arn
}