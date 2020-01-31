variable "enabled" {
  default = "true"
}

variable "is_ipv6_enabled" {
  default = "true"
}

variable "comment" {
  default = "Terraform"
}

variable "default_root_object" {
  default = "index.html"
}

variable "log_include_cookies" {
  default = "false"
}

variable "domainname" {
  type = "string"
}

variable "origin_id" {
  type = "string"
}

variable "acm_certificate_arn" {
  type = "string"
}

variable "minimum_protocol_version" {
  type = "string"
}

variable "aliases" {
  type = "list"
}
