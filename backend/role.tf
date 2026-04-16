# --- github_action用ロール作成 ---
resource "aws_iam_role" "github_action_role" {
  name = "github-action-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
        "Effect": "Allow",
        "Principal": {
            "Federated": aws_iam_openid_connect_provider.github.arn
        },
        "Action": "sts:AssumeRoleWithWebIdentity",
        "Condition": {
            "StringLike": {
                "token.actions.githubusercontent.com:sub": [
                    "repo:bananaumai96-sudo/cognito:*"
                ]
            }
        }
    }]
  })
}


resource "aws_iam_role_policy_attachment" "github_action_policy" {
  role       = aws_iam_role.github_action_role.name
  policy_arn = var.policy
}
