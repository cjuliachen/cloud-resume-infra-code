provider "aws" {
  region                   = var.my_aws_region
  shared_credentials_files = [var.my_aws_creds]
  profile                  = var.my_aws_profile
}

# Region alias to use for Cloudfront
provider "aws" {
  alias                    = "us-east-1"
  region                   = "us-east-1"
  shared_credentials_files = [var.my_aws_creds]
  profile                  = var.my_aws_profile
}