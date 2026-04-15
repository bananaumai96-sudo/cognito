resource "aws_dynamodb_table" "example" {
  name         = "users"
  billing_mode = var.modules_db_billing_mode

  hash_key = var.modules_db_hash_key

  attribute {
    name = var.modules_db_hash_key
    type = var.modules_db_key_type
  }

  attribute {
    name = var.modules_db_gsi_hash_key
    type = var.modules_db_gsi_key_type
  }

  global_secondary_index {
    name            = var.modules_db_gsi_name
    hash_key        = var.modules_db_gsi_hash_key
    projection_type = var.modules_db_gsi_projection_type
  }

}
