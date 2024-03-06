# Basic S3 Bucket Template

This CloudFormation template creates a simple S3 bucket with an auto-generated name.

## Building via CloudFormation


### Deploy the stack
```
aws cloudformation deploy --stack-name aws-cf-s3-create-unique-name --template cloudformation/aws-cf-s3-template.yaml
```

### Test S3 bucket was created
```
aws s3api list-buckets
```
_Check results for CreationDate that matches the current day and time_

### Delete the stack
```
aws cloudformation delete-stack --stack-name aws-cf-s3-create-unique-name
```