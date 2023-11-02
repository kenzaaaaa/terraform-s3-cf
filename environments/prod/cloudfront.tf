
module "cloudfront1" {
  source     = "../../modules/cloudfront"

  bucket = module.s3_bucket1.bucket_id
  environment = "production"
  bucket_regional_domain_name = module.s3_bucket1.bucket_regional_domain_name
  origin_path = "/auth"
  default_root_object = "index-auth.html"
  origin_access_control_name = "CloudFront_Distribution1_Prod-origin_access_control"
}

module "cloudfront2" {
  source     = "../../modules/cloudfront"

  bucket = module.s3_bucket2.bucket_id
  environment = "production"
  bucket_regional_domain_name = module.s3_bucket2.bucket_regional_domain_name
  origin_path = "/info"
  default_root_object = "index-info.html"
  origin_access_control_name = "CloudFront_Distribution2_Prod-origin_access_control"
}

module "cloudfront3" {
  source     = "../../modules/cloudfront"

  bucket = module.s3_bucket3.bucket_id
  environment = "production"
  bucket_regional_domain_name = module.s3_bucket3.bucket_regional_domain_name
  origin_path = "/customers"
  default_root_object = "index-customers.html"
  origin_access_control_name = "CloudFront_Distribution3_Prod-origin_access_control"
}