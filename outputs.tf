output "S3_Bucket" {
    value = aws_s3_bucket.opentofu_state.id
}
