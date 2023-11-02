###################################
# Creating CloudFront Distribution CloudFront_Distribution
###################################
resource "aws_cloudfront_distribution" "CloudFront_Distribution" {

origin {
    # domain_name              = aws_s3_bucket.s3_bucket1.bucket_regional_domain_name
    domain_name              = var.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.CloudFront_Distribution-origin_access_control.id
    origin_id                = var.bucket
    origin_path              = var.origin_path
  }

  comment             = var.origin_path
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = var.default_root_object

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.bucket
    viewer_protocol_policy = "allow-all"
    # viewer_protocol_policy = "redirect-to-https"
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }
    # logging_config {
    #     include_cookies = false
    #     bucket          = "mylogs.s3.amazonaws.com"
    #     prefix          = "myprefix"
    # }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
    restriction_type = "none"
    }
  }

  tags = {
    Environment = var.environment
    Terraform = "True"    
  }

}


###################################
# Creating CloudFront Origin Access Control CloudFront_Distribution-origin_access_control
###################################
resource "aws_cloudfront_origin_access_control" "CloudFront_Distribution-origin_access_control" {
  name                              = var.origin_access_control_name
  description                       = "Origin Access Control Policy for S3 Bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}