provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "winbucket" {
    bucket = "winoto62920"
    acl = "public-read"
  
}

resource "aws_s3_bucket" "winbucket2" {
    bucket = "winoto62920B"
    acl = "public-read"
  
}