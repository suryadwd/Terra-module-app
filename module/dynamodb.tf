resource "aws_dynamodb_table" "dynamodb" {
  name           = "${var.env}-${var.db_name}"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key = var.hash_key
  
  attribute {
    name =  var.hash_key
    type = "S"
  }

  tags = {
    Name        = "${var.env}-${var.db_name}"
  }
}