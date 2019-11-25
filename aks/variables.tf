variable "client_id" {
  default = "14443c0e-9c86-4a2e-9290-3d74d4e31198"
}
variable "client_secret" {
}

variable "tenant_id" {
  default = "08997936-f3a2-4962-945b-3c45e8441349"
} 
  
variable "subscription_id" {
  default = "675f8836-47e4-4f96-a3ca-c41e000b31e3"
}

variable "agent_count" {
  default = 2
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
  default = "aplicamos"
}

variable cluster_name {
  default = "aplicamos"
}

variable resource_group_name {
  default = "Aplicamos-STAGING"
}

variable location {
  default = "West US"
}

variable network_plugin {
  default = "kubenet"
}

variable address_space {
  type = "map"
  default = {
    staging = "192.168.0.0/16"
    prod    = "10.1.0.0/16"
  }
}

variable address_prefix {
  type = "map"
  default = {
    staging = "192.168.0.0/24"
    prod    = "10.1.0.0/24"
  }
}

variable "vm_size" {
  default = "Standard_D1"
}

variable "os_type" {
  default = "Linux"
}

variable "os_disk_size_gb" {
  default = 30
}


variable "tags" {
  type = "map"

  default = {
    "Env"  = "dev"
    "Name" = "aks-resource"
    "Team" = "aplicamos"
  }
}


