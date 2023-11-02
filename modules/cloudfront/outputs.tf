output "cloudfront_distribution_domain_name" {
  value = aws_cloudfront_distribution.CloudFront_Distribution.domain_name
}

output "cloudfront_distribution_arn" {
  value = aws_cloudfront_distribution.CloudFront_Distribution.arn
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.CloudFront_Distribution.id
}
