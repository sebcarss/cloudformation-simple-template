# Fanout Event System

This example script builds a standard SNS fanout event system for processing data stored in an S3 bucket and translates it to a DynamoDB table. 

The architecture consists of the following: 

`S3 Bucket - SNS Topic - Lambda - DynamoDB`

This architecture will require an authorised role to be assumed to write to the S3 bucket. 

In the example we will create a system that stores order history details in an S3 bucket and the item details get summarised in the DynamoDB where a monthly statement of items ordered can be sent to the customer, with links to the parcel details in S3 if they want to download them separately. 

## Terrraform

