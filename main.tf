terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "tf-bucket-for-03-26-24-project"
}
