###################################
# Creating S3 Bucket
###################################
resource "aws_s3_bucket" "s3_bucket" {
  bucket        = var.bucket
  force_destroy = true

  tags = {
    Environment = var.environment
    Terraform   = "True"
  }
}

###################################
# Setting up versioning for S3 Bucket
###################################
resource "aws_s3_bucket_versioning" "S3_bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

###################################
# Enabling SSE encryption for S3 Bucket
###################################
resource "aws_s3_bucket_server_side_encryption_configuration" "S3_bucket_SSE" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# ###################################
# # S3 Bucket1 Policy for CloudFront1 Access
# ###################################

resource "aws_s3_bucket_policy" "CloudFront_access" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.CloudFront_access.json
}

data "aws_iam_policy_document" "CloudFront_access" {
	statement {
		principals {
			type        = "Service"
			identifiers = ["cloudfront.amazonaws.com"]
		}

		actions = ["s3:GetObject"]
		resources = ["${aws_s3_bucket.s3_bucket.arn}/*"]

		condition {
			test     = "StringEquals"
			variable = "AWS:SourceArn"
			values   = [var.cloudfront_distribution_arn]
		}
	}
}


# ###################################
# # S3 Bucket1 Object import
# ###################################
resource "aws_s3_object" "object" {
  bucket       = var.bucket
  key          = var.object_key
  source       = var.source_file  #"index-auth.html"
  content_type = "text/html"

  etag = filemd5(var.source_file)
  depends_on = [
    aws_s3_bucket.s3_bucket
  ]
}