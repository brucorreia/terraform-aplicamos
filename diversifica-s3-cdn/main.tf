provider "aws" {
  profile                 = "default"
  shared_credentials_file = "~/.aws/config"
  region                  = "${var.region}"
}

# Do not possible to use variable in this block
terraform {
  required_version = ">= 0.11.7"

  backend "s3" {
    bucket = "aplicamos-config"
    key    = "terraform/diversifica-s3-cdn/terraform.tfstate"
    region = "us-east-1"
  }
}

module "s3" {
  source      = "../modules/s3"
  bucket_site = "${var.bucket_site}"

  tags = {
    Name = "${lookup(var.tags, "Name")}"
    Env  = "${lookup(var.tags, "Env")}"
  }
}

module "s3_object" {
  source = "../modules/s3_object"
  bucket = "${module.s3.bucket_site_id}"
  upfile = "${var.upfile}"
}

module "cloudfront_s3_origin" {
  source     = "../modules/cloudfront_s3_origin"
  domainname = "${module.s3.bucket_site_domainname}"
  origin_id  = "${module.s3.bucket_site_domainname}"
  acm_certificate_arn = "${var.acm_certificate_arn}"
  minimum_protocol_version = "${var.minimum_protocol_version}"
  aliases = "${var.aliases}"
}
