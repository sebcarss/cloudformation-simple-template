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

resource "aws_sns_topic" "order_history_topic" {
  name   = "rsc-order-history-topic"
  policy = data.aws_iam_policy_document.order_history_notification_policy.json
}

resource "aws_s3_bucket_notification" "order_history_topic_notifications" {
  bucket = aws_s3_bucket.order_history_bucket.id

  topic {
    topic_arn = aws_sns_topic.order_history_topic.arn
    events    = ["s3:ObjectCreated:*"]
  }
}

data "aws_iam_policy_document" "order_history_notification_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    actions   = ["SNS:Publish"]
    resources = ["arn:aws:sns:*:*:rsc-order-history-topic"]

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [aws_s3_bucket.order_history_bucket.arn]
    }
  }
}