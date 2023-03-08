data "aws_caller_identity" "current" {}

data "aws_route53_zone" "myzone" {
  name = var.domain_name
}

data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.website.arn}/*"]
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.cf.arn]
    }
  }
}

data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "dynamodb_access" {
  statement {
    sid    = "DynamoDBRW"
    effect = "Allow"
    actions = [
      "dynamodb:PutItem",
      "dynamodb:GetItem",
      "dynamodb:Query",
      "dynamodb:UpdateItem"
    ]
    resources = ["${aws_dynamodb_table.ddbtable.arn}"]
    # resources = ["${var.ddbtable_arn}"]
  }
}


data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda/lambda_function.py"
  output_path = "${path.module}/${var.lambda_function_name}-deployment-package.zip"
}



### record total hits before rebuilt ###
# data "aws_dynamodb_table_item" "ddbtable_item" {
#   table_name = aws_dynamodb_table.ddbtable.name
#   # expression_attribute_names = {
#   #   "#S" = "hits"
#   # }
#   projection_expression = "hits"
#   key                   = <<KEY
# {
#  "id": {
#     "S": "visitor"
#   }
# }
# KEY
#   # depends_on = [aws_dynamodb_table_item.dbtable_item]
# }
