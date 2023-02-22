# cloud-resume-infra-code
## Purpose
This repo contains all the Terraform files for building the backend infrastructure (S3 bucket, Cloudfront distribution, DynamoDB, Lambda function and API Gateway) for my online resume (https://resume.juliachen.ca)

## Requirements
Please add a .tfvars file to customize these variables:

```
my_aws_region        = "US-EAST-1"
bucket_name          = "YOUR-BUCKET-NAME"
domain_name          = "YOUR-ROOT-DOMAIN-NAME"
endpoint             = "YOUR-RESUME-SITE-DOMAIN-NAME"
api_domain           = "YOUR-API-DOMAIN-NAME"
my_aws_creds         = "PATH-TO-AWS-CREDENTIAL-FILE"
my_aws_profile       = "AWS-PROFILE-NAME"
project_name         = "cloud-resume"
dynamodb_table_name  = "cloud-resume-visitor-count"
lambda_script_name   = "get-visitor-count.py"
lambda_function_name = "get-visitor-count"
lambda_handler_name  = "get_visitor_count"
lambda_runtime       = "python3.9"
```