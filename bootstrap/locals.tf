# --- IAMポリシーのAction一覧 ---
locals {
  s3_Actions = [
    "s3:CreateBucket",
    "s3:PutBucketPolicy",
    "s3:PutBucketAcl",
    "s3:PutEncryptionConfiguration",
    "s3:PutLifecycleConfiguration",
    "s3:PutBucketPublicAccessBlock",
    "s3:PutBucketLogging",
    "s3:HeadBucket",
    "s3:ListBucket",
    "s3:GetBucketLocation",
    "s3:GetBucketTagging",
    "s3:PutBucketTagging",
    "s3:GetBucketPolicy",
    "s3:GetBucketAcl",
    "s3:GetObject",
    "s3:PutObject",
    "s3:GetBucketCORS",
    "s3:GetBucketWebsite",
    "s3:GetBucketVersioning",
    "s3:GetAccelerateConfiguration",
    "s3:GetBucketRequestPayment",
    "s3:GetBucketLogging",
    "s3:GetLifecycleConfiguration",
    "s3:GetReplicationConfiguration",
    "s3:GetEncryptionConfiguration",
    "s3:GetBucketObjectLockConfiguration",
    "s3:GetBucketPublicAccessBlock",
    "s3:DeleteBucket",
    "s3:DeleteObject",
    "s3:PutBucketOwnershipControls",
    "s3:GetBucketOwnershipControls",
    "s3:DeleteBucketPolicy",
    "s3:PutBucketNotification",
    "s3:GetBucketNotification",
    "s3:PutBucketWebsite",
    "s3:DeleteBucketWebsite"
  ]

  iam_Actions = [
    "iam:CreateRole",
    "iam:AttachRolePolicy",
    "iam:PassRole",
    "iam:GetRole",
    "iam:ListRolePolicies",
    "iam:DeleteRole",
    "iam:ListAttachedRolePolicies",
    "iam:DetachRolePolicy",
    "iam:ListInstanceProfilesForRole",
    "iam:PutRolePolicy",
    "iam:GetRolePolicy",
    "iam:DeleteRolePolicy",
    "iam:UpdateAssumeRolePolicy",
    "iam:CreatePolicy",
    "iam:CreateInstanceProfile",
    "iam:GetInstanceProfile",
    "iam:GetPolicy",
    "iam:GetPolicyVersion",
    "iam:ListRoles",
    "iam:DeleteInstanceProfile",
    "iam:ListPolicyVersions",
    "iam:DeletePolicy",
    "iam:AddRoleToInstanceProfile",
    "iam:RemoveRoleFromInstanceProfile",
    "iam:CreateOpenIDConnectProvider",
    "iam:GetOpenIDConnectProvider",
    "iam:DeleteOpenIDConnectProvider"
  ]

  lambda_Actions = [
    "lambda:CreateFunction",
    "lambda:GetFunction",
    "lambda:ListVersionsByFunction",
    "lambda:GetFunctionCodeSigningConfig",
    "lambda:DeleteFunction",
    "lambda:UpdateFunctionConfiguration",
    "lambda:AddPermission",
    "lambda:GetPolicy",
    "lambda:RemovePermission",
    "lambda:UpdateFunctionCode"
  ]

  api_Actions = [
    "apigateway:GET",
    "apigateway:POST",
    "apigateway:PUT",
    "apigateway:DELETE",
    "apigateway:PATCH"
  ]
  dynamodb_Actions = [
    "dynamodb:CreateTable",
    "dynamodb:DescribeTable",
    "dynamodb:DeleteTable",
    "dynamodb:ListTables",
    "dynamodb:DescribeContinuousBackups",
    "dynamodb:DescribeTimeToLive",
    "dynamodb:ListTagsOfResource",
    "dynamodb:UpdateTable",
    "dynamodb:PutItem",
    "dynamodb:GetItem",
    "dynamodb:DeleteItem"
  ]

  cognito_Actions = [
    "cognito-idp:CreateUserPool",
    "cognito-idp:DeleteUserPool",
    "cognito-idp:DescribeUserPool",
    "cognito-idp:UpdateUserPool",
    "cognito-idp:GetUserPoolMfaConfig",
    "cognito-idp:CreateUserPoolClient",
    "cognito-idp:CreateUserPoolDomain",
    "cognito-idp:DescribeUserPoolDomain",
    "cognito-idp:DescribeUserPoolClient",
    "cognito-idp:DeleteUserPoolDomain",
    "cognito-idp:AdminCreateUser",
    "cognito-idp:AdminGetUser",
    "cognito-idp:AdminDeleteUser",
    "cognito-idp:UpdateUserPoolClient",
    "cognito-idp:DeleteUserPoolClient"
  ]

  cloudfront_Actions = [
    "cloudfront:CreateDistribution",
    "cloudfront:GetDistribution",
    "cloudfront:GetDistributionConfig",
    "cloudfront:ListDistributions",
    "cloudfront:TagResource",
    "cloudfront:ListTagsForResource",
    "cloudfront:UpdateDistribution",
    "cloudfront:DeleteDistribution",
    "cloudfront:CreateCachePolicy",
    "cloudfront:CreateResponseHeadersPolicy",
    "cloudfront:CreateOriginRequestPolicy",
    "cloudfront:GetResponseHeadersPolicy",
    "cloudfront:GetOriginRequestPolicy",
    "cloudfront:GetCachePolicy",
    "cloudfront:DeleteResponseHeadersPolicy",
    "cloudfront:DeleteOriginRequestPolicy",
    "cloudfront:DeleteCachePolicy",
    "cloudfront:UpdateCachePolicy",
    "cloudfront:ListOriginRequestPolicies",
    "cloudfront:ListCachePolicies",
    "cloudfront:CreateOriginAccessControl",
    "cloudfront:GetOriginAccessControl",
    "cloudfront:UpdateOriginAccessControl",
    "cloudfront:DeleteOriginAccessControl"
  ]

  common_tags = {
    Project   = var.project_name
    ManagedBy = "terraform"
  }

}
