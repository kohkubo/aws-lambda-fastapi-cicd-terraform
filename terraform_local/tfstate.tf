# tfstate用のS3バケットを作成
resource "aws_s3_bucket" "tfstate" {
  bucket = "my-tfstate-bucket-${data.aws_caller_identity.current.account_id}"
}

# S3バケットのバージョニングを有効化
resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}
