#
# Provider Configuration
#

provider "aws" {
  profile                 = "default"
  shared_credentials_file = "~/.aws/config"
  region                  = "us-east-1"
}

# Do not possible to use variable in this block
terraform {
  required_version = ">= 0.11.7"

  backend "s3" {
    bucket = "aplicamos-config"
    key    = "terraform/eks/terraform.tfstate"
    region = "us-east-1"
  }
}

# Using these data sources allows the configuration to be
# generic for any region.
data "aws_region" "current" {}

data "aws_availability_zones" "available" {}

# Not required: currently used in conjuction with using
# icanhazip.com to determine local workstation external IP
# to open EC2 Security Group access to the Kubernetes cluster.
# See workstation-external-ip.tf for additional information.
provider "http" {}
