
terraform {
  required_version = ">= 0.11.7"

  backend "s3" {
    bucket = "aplicamos-config"
    key    = "terraform/diversifica-route53/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_route53_zone" "main" {
  name = "diversifica.me"

  tags = {
    Environment = "prod"
  }
}

resource "aws_route53_record" "cert" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name    = "_6f372b8aa6d5b9bffe4de8e911d9796f.diversifica.me."
  type    = "CNAME"
  ttl     = "5"

  weighted_routing_policy {
    weight = 100  
  }

  set_identifier = "cert"
  records        = ["_9e3b9bc27d4ecab10ad557aa37d06ea0.nhqijqilxf.acm-validations.aws."]
}


resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name    = "www.diversifica.me."
  type    = "CNAME"
  ttl     = "5"

  weighted_routing_policy {
    weight = 100  
  }

  set_identifier = "www"
  records        = ["d3eku2uk4mdcuy.cloudfront.net"]
}
