
resource "aws_s3_bucket" "this" {
bucket = "namba008-cts-bucket"
}


resource "aws_s3_bucket_ownership_controls" "static" {
  bucket = aws_s3_bucket.this.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "static" {
  depends_on = [aws_s3_bucket_ownership_controls.static]

  bucket = aws_s3_bucket.this.id
  acl    = "private"
}
