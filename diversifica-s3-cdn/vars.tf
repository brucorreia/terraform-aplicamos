variable "tags" {
  type = "map"

  default = {
    "Name" = "diversifica"
    "Env"  = "Prod"
  }
}

variable "region" {
  default = "us-east-1"
}

variable "bucket_site" {
  default = "diversifica.me"
}

variable "acm_certificate_arn" {
  default = "arn:aws:acm:us-east-1:490089276961:certificate/fc10d8ca-08c4-409d-919f-4aa5caa74115"
}

variable "minimum_protocol_version" {
  default = "TLSv1"
}

variable "upfile" {
  default = "./staticfiles/index.html"
}

variable "aliases" {
  type = "list"
  default = ["diversifica.me"]
}