# Basic Lambda Function Template

This CloudFormation template deploys a Lambda function from a inline code.

## Roles

Lambdas require a Role to assume so that they can access other services in AWS. The Lambda service requires access to CloudWatch logs so that it can stream logs, so this is the minimum that is required to set up a lambda. 

A role can be created using the following CLI command: 

```
aws iam create-role --role-name lambda-ex --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
```

❗️ _Note: this doesn't include the CloudWatch logs_

Or it can be added to the CloudFormation script as part of the Resources. 

## Building via CloudFormation

The CloudWatch service needs permission to create an IAM role, to do this using the CLI you need to add `--capabilities CAPABILITY_IAM` to the command, e.g. 

### Deploy the stack

```
aws cloudformation deploy --template aws-cf-lambda-inline-code.yaml --stack-name aws-cf-lambda-inline-code-stack --capabilities CAPABILITY_IAM
```

### Test the function was created
```
aws lambda list-functions
```
_check that a function exists with a FunctionName similar to the one passed in the stack_

### Test the lambda invocation
```
aws lambda invoke --function-name <FunctionName-of-lambda> tmp.json
```
You will receive a response that includes the StatusCode of 200 if it is a success and a `tmp.json` file will be created with the output of the lambda execution, which in the template is a list of all the S3 buckets in the account. 

### Delete the stack
```
aws cloudformation delete-stack --stack-name aws-cf-lambda-inline-code-stack
```