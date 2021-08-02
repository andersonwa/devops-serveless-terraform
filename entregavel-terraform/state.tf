terraform {
  backend "s3" {
    bucket = "s3_bucket"
    key    = "teste"
    region = "us-east-1"
  }
}