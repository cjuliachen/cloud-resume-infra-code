# cloud-resume-infra-code
## Purpose
This repo contains all the Terraform files for building the backend infrastructure (S3 bucket, CloudFront distribution, DynamoDB, Lambda function and API Gateway) for my online resume (https://resume.juliachen.ca)

## Requirements
Please add a .tfvars file to customize these variables:

```
my_aws_region        = "ca-central-1"
bucket_name          = "YOUR-BUCKET-NAME"
domain_name          = "YOUR-ROOT-DOMAIN-NAME"
endpoint             = "YOUR-RESUME-SITE-DOMAIN-NAME"
api_domain           = "YOUR-API-DOMAIN-NAME"
my_aws_creds         = "PATH-TO-AWS-CREDENTIAL-FILE"
my_aws_profile       = "AWS-PROFILE-NAME"
project_name         = "cloud-resume"
dynamodb_table_name  = "cloud-resume-visitor-count"
lambda_function_name = "cloud-resume-get-visitor-count"
lambda_runtime       = "python3.9"
```

## GitHub Actions
1. pre-commit:
    Run through Python "pre-commit" with tools listed in the ".pre-commit-config.yaml".
2. codeql:
    Static Code Analysis scan using "CodeQL". This scan focuses on the Lambda function written in Python.
3. checkov:
    Static Code Analysis scan using "Checkov". This scan focuses on the Terraform (IaC) files.
4. build and deploy:
    Run Terraform commands to deploy backend infrastructure in AWS
