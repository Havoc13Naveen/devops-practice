resource "aws_dynamodb_table" "dydb" {
    hash_key = "LockID"
    name = var.dynamodb_name
    billing_mode = "PAY_PER_REQUEST"
    attribute {
      name = "LockID"
      type = "S"
    }
}