terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "order_history_bucket" {
  bucket = "rsc-order-history-bucket"

  tags = {
    Name        = "Order History Bucket"
    Environment = "Dev"
  }
}