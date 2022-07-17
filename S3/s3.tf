resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  versioning {
    enabled = true
  }

  tags = {
    OwnedBy     = "Terraform"
    Environment = "QA"
  }
}
