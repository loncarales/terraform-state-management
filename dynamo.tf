#  To use DynamoDB for locking with Opentofu
resource "aws_dynamodb_table" "opentofu_locks" {
  name           = var.dynamodb_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
