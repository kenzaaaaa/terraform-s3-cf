###################################
# Creating KMS Key for Bucket Encryption
###################################
resource "aws_kms_key" "S3_buckets_dev_key" {
  description = "This key is used to encrypt Dev S3 bucket objects"
  #   deletion_window_in_days = 10
  enable_key_rotation = true
}

# ##################################
# # Creating KMS Key Policy for CloudFront Access
# ##################################
# resource "aws_kms_key_policy" "cloudfront_kms_key_access" {
#   key_id = aws_kms_key.S3_buckets_dev_key.id
#   policy = data.aws_iam_policy_document.oac_kms_key_access.json
# }

# data "aws_iam_policy_document" "oac_kms_key_access" {
#   statement {
#     sid = "Allow KMS Use"
#     effect = "Allow"
  
#     principals {
#       type        = "Service"
#       identifiers = ["cloudfront.amazonaws.com"]
#     }

#     actions = [
#       "kms:Encrypt",
#       "kms:Decrypt",
#       "kms:ReEncrypt*",
#       "kms:GenerateDataKey*",
#       "kms:DescribeKey",
#     ]
#     resources = [ "S3_buckets_dev_key.arn" ]
#   }
# }