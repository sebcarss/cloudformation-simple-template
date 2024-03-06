
# Repo for learning Infrastructure as Code with Templates

This repository is a personal project to learn infrastructure as code using both CloudFormation and Terraform. The idea is to work out how the services work and how to build common patterns in AWS that can be deployed quickly and easily so that a developer can concentrate on the business login instead of writing boilerplate infrastructure code. 

## AWS Scripts for CloudFormation

### Deploy CloudFormation template to AWS

```
aws cloudformation deploy --template template.yaml --stack-name aws-temp-s3-bucket
```

### Tear Down Stack

```
aws cloudformation delete-stack --stack-name aws-temp-s3-bucket
```