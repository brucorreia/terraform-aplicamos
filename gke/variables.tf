variable "project" {
  default     = "nth-armor-238300"
  type        = string
}

variable "location" {
  default     = "us-west2"
  type        = string
}

variable "region" {
  default     = "us-west2"
  type        = string
}

variable "cluster_name" {
  type        = string
  default     = "aplicamos"
}

variable "cluster_service_account_name" {
  type        = string
  default     = "aplicamos-sa"
}

variable "cluster_service_account_description" {
  type        = string
  default     = "GKE Cluster Service Account managed by Terraform"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.6.0.0/16"
}

variable "vpc_secondary_cidr_block" {
  type        = string
  default     = "10.7.0.0/16"
}

variable "override_default_node_pool_service_account" {
  type        = bool
  default     = false
}
