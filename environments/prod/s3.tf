module "s3_bucket1" {
  source = "../../modules/s3"

  bucket = "finnet-io-bucket1-prod"
  environment = "production"
  kms_key_arn = aws_kms_key.S3_buckets_prod_key.arn
  cloudfront_distribution_arn = module.cloudfront1.cloudfront_distribution_arn
  source_file = "index-auth.html"
  object_key ="auth/index-auth.html"
}

module "s3_bucket2" {
  source = "../../modules/s3"

  bucket = "finnet-io-bucket2-prod"
  environment = "production"
  kms_key_arn = aws_kms_key.S3_buckets_prod_key.arn
  cloudfront_distribution_arn = module.cloudfront2.cloudfront_distribution_arn
  source_file = "index-info.html"
  object_key ="info/index-info.html"
}

module "s3_bucket3" {
  source = "../../modules/s3"

  bucket = "finnet-io-bucket3-prod"
  environment = "production"
  kms_key_arn = aws_kms_key.S3_buckets_prod_key.arn
  cloudfront_distribution_arn = module.cloudfront3.cloudfront_distribution_arn
  source_file = "index-customers.html"
  object_key ="customers/index-customers.html"
}