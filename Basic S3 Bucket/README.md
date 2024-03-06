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

## Building via Terraform

### Initialise the stack
First make sure you are in the terraform directory
```
cd terraform
```
Then initialise the stack
```
terraform init
```
This will ensure that it either creates the lock file or uses the lock file to ensure consistency with future initialisations. 

### Format the terraform file
Formatting the file is good for consistency
```
terraform fmt
```

### Validate the terraform file
```
terraform validate
```

### Deploy the stack
```
terraform apply
```
You will need to approve the deploy by typing 'yes' and hitting enter. 

### Test the S3 bucket was created
```
aws s3api list-buckets
```
There should be a new bucket with a CreationDate that is very recent. 

### Delete the stack
```
terraform destroy
```