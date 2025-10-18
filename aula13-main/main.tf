terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "simple_bucket" {
  bucket = var.bucket_name

  tags = {
    Environment = "devsecops"
    ManagedBy   = "terraform"
  }
}

