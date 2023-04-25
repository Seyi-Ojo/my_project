//CREATING MY S3 BUCKET
resource "aws_s3_bucket" "seyimeyus-project-terraform-bucket" {
  bucket = "seyimeyus-project-terraform-bucket"

  lifecycle {
    prevent_destroy = true
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

//CREATING MY DYNAMODB TABLE FOR BACKEND STATEFILE LOCKING
resource "aws_dynamodb_table" "terraform-state-lock" {
  name             = "terraform-state-lock"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}