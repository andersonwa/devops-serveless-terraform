resource "aws_s3_bucket" "s3_bucket" {
  bucket = "lab-fiap-78aoj-339812"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_policy" "results_updates_s3_policy" {
  bucket = aws_s3_bucket.s3_bucket.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "s3policy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:PutObject",
      "Resource": "${aws_s3_bucket.s3_bucket.arn}/*"
    }
  ]
}
POLICY
}