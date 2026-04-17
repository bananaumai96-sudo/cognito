# --- IAMポリシー作成 ---
data "aws_iam_policy_document" "terraform_policy" {
  statement {
    sid       = "s3Actions"
    effect    = "Allow"
    actions   = local.s3_Actions
    resources = ["*"]
  }

  statement {
    sid       = "IAMActions"
    effect    = "Allow"
    actions   = local.iam_Actions
    resources = ["*"]
  }

  statement {
    sid       = "lambdaActions"
    effect    = "Allow"
    actions   = local.lambda_Actions
    resources = ["*"]
  }

  statement {
    sid       = "apiActions"
    effect    = "Allow"
    actions   = local.api_Actions
    resources = ["*"]
  }

  statement {
    sid       = "dynamodbActions"
    effect    = "Allow"
    actions   = local.dynamodb_Actions
    resources = ["*"]
  }

  statement {
    sid       = "cognitoActions"
    effect    = "Allow"
    actions   = local.cognito_Actions
    resources = ["*"]
  }

  statement {
    sid       = "cloudfrontActions"
    effect    = "Allow"
    actions   = local.cloudfront_Actions
    resources = ["*"]
  }
}

resource "aws_iam_policy" "terraform_policy" {
  name   = "terraform-s3-api-lambda"
  policy = data.aws_iam_policy_document.terraform_policy.json
  tags   = merge(local.common_tags, { Name = "terraform-terraform-s3-api-lambda" })
}
