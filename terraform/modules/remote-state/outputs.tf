output "remote_state_bucket" {
  value = aws_s3_bucket.this.bucket
}

output "dynamo_table" {
  value = aws_dynamodb_table.this.name
}
