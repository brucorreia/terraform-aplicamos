variable "tags" {
  type = "map"

  default = {
    "Name" = "aplicamos"
    "Env"  = "Prod"
  }
}

variable "region" {
  default = "us-east-1"
}

variable "bucket_site" {
  default = "aplicamos.com.br"
}

variable "acm_certificate_arn" {
  default = "arn:aws:acm:us-east-1:490089276961:certificate/fadacad5-2a9c-4ed1-8610-f44c3a0e1fc2"
}

variable "minimum_protocol_version" {
  default = "TLSv1"
}

variable "upfile" {
  default = "./staticfiles/index.html"
}

variable "aliases" {
  type = "list"
  default = ["aplicamos.com.br"]
}
