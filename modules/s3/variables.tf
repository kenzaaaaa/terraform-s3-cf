variable "bucket" {
  type    = string
}

variable "environment" {
  type    = string
}

variable "kms_key_arn" {
  type    = string
}

variable "cloudfront_distribution_arn" {
  type    = string
}

variable "source_file" {
}

variable "object_key" {
  type    = string
}
