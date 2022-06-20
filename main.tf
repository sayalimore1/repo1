provider "aws" {
  region  = "ap-south-1"
  
}

resource "aws_s3_bucket" "bucket" {
  bucket = "sayali-buckett"
  

  tags = {
    Name        = "sayali-buckett"
    Owner       = "sayali"
  }
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
  
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_policy" "policy" {
 bucket = aws_s3_bucket.bucket.id



 policy = <<POLICY

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::sayali-buckett/*"
        }
    ]
}
POLICY
}
