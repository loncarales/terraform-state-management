resource "aws_s3_bucket" "opentofu_state" {
  bucket = var.bucket_name
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "opentofu_state" {
  bucket = aws_s3_bucket.opentofu_state.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Enable versioning so we can see the full revision history of our state files
resource "aws_s3_bucket_versioning" "opentofu_state" {
  bucket = aws_s3_bucket.opentofu_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
