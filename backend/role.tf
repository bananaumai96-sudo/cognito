# --- github_action用ロール作成 ---
resource "aws_iam_role" "github_action_role" {
  name = "github-action-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
        "Effect": "Allow",
        "Principal": {
            "Federated": "arn:aws:iam::${var.aws_account}:oidc-provider/token.actions.githubusercontent.com"
        },
        "Action": "sts:AssumeRoleWithWebIdentity",
        "Condition": {
            "StringEquals": {
                "token.actions.githubusercontent.com:sub": "repo:bananaumai96-sudo/cognito:ref:refs/heads/main"
            }
        }
    }]
  })
}


resource "aws_iam_role_policy_attachment" "github_action_policy" {
  role       = aws_iam_role.github_action_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
