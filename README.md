
# Repo for learning CloudFormation Templating

## AWS Scripts for CloudFormation

### Deploy CloudFormation template to AWS

```
aws cloudformation deploy --template template.yaml --stack-name aws-temp-s3-bucket
```

### Tear Down Stack

```
aws cloudformation delete-stack --stack-name aws-temp-s3-bucket
```