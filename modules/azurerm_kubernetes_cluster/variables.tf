variable "client_id" {}
variable "client_secret" {}

variable "agent_count" {
    default = 1
}

variable "dns_prefix" {}

variable cluster_name {}

variable network_plugin {}

variable "location" {}

variable "resource_group_name" {}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "vnet_subnet_id" {}

variable "os_disk_size_gb" {}

variable "os_type" {}

variable "vm_size" {}

variable "pool_name" {}

variable "tags" {
  type = "map"
}