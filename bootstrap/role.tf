# --- ロール作成 ---
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [var.user_name]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "terraform_exec" {
  name               = "Terraform-s3-api-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = merge(local.common_tags, { Name = "Terraform-s3-lambda-role" })
}
