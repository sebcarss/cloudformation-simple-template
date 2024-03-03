# Basic Lambda Function Template

This CloudFormation template deploys a Lambda function from a zip file that is stored in S3. 

📝 _Note: Zip file location is inline in the Code property currently. But this should be changed to s zip stored in S3 at some point._

### Roles

Lambdas require a Role to assume so that they can access other services in AWS. The Lambda service requires access to CloudWatch logs so that it can stream logs, so this is the minimum that is required to set up a lambda. 

A role can be created using the following CLI command: 
❗️ _Note: this doesn't include the CloudWatch logs_
```
aws iam create-role --role-name lambda-ex --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
```

Or it can be added to the CloudFormation script as part of the Resources. 

### Deploying the Stack

The CloudWatch service needs permission to create an IAM role, to do this using the CLI you need to add `--capabilities CAPABILITY_IAM` to the command, e.g. 

```
aws codeformation deploy --template template.yaml --stack-name temp-stack --capabilities CAPABILITY_IAM
```
