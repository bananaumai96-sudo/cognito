variable "modules_name" {
  description = "関数名"
  type        = string
}

variable "modules_handler" {
  description = "LambdaHandler"
  type        = string
}

variable "modules_runtime" {
  description = "ランタイム"
  type        = string
}

variable "modules_filename" {
  description = "コードのファイル名(zipファイル)"
  type        = string
}

variable "modules_lambda_policy_arn" {
  description = "LambdaポリシーARN"
  type        = string
}

variable "modules_lambda_db_policy_arn" {
  description = "Lambdadb用ポリシーARN"
  type        = string
}


variable "modules_lambda_action" {
  description = "lambda_action"
  type        = string
}

variable "modules_lambda_principal" {
  description = "lambdaのロール用principal"
  type        = string
}
