terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "cc-bucket-for-7-13-23-demo"
}
