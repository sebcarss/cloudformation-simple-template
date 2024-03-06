# Basic S3 Bucket Template

This CloudFormation template creates a simple S3 bucket with an auto-generated name.

## Building via CloudFormation

```
# Deploy the stack
aws cloudformation deploy --stack-name aws-cf-s3-create-unique-name --template aws-cf-s3-template.yaml

# Test S3 bucket was created
aws s3api list-buckets
# Check results for CreationDate that matches the current day and time

# Destroy the stack
aws cloudformation
```