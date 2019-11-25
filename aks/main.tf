provider "azurerm" {
  skip_credentials_validation = true
  tenant_id = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
}

terraform {
  required_version = ">= 0.11.7"

  backend "s3" {
    bucket = "aplicamos-config"
    key    = "terraform/aks/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "azurerm_resource_group" "arg" {
  name     = "rg-${lookup(var.tags, "Team")}-${terraform.workspace}"
  location = "${var.location}"
}

module "azurerm_virtual_network" {
  source              = "../modules/azurerm_virtual_network"
  name                = "${lookup(var.tags, "Team")}-aks-vnet-${terraform.workspace}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.arg.name}"
  address_space       = "${lookup(var.address_space, terraform.workspace)}"
  tags = {
    Team = "${lookup(var.tags, "Team")}"
    Name = "${lookup(var.tags, "Name")}"
    Env  = "${terraform.workspace}"
  }
}

module "azurerm_subnet" {
  source               = "../modules/azurerm_subnet"
  name                 = "${lookup(var.tags, "Team")}-aksnodes-${terraform.workspace}"
  resource_group_name  = "${azurerm_resource_group.arg.name}"
  address_prefix       = "${lookup(var.address_prefix, terraform.workspace)}"
  virtual_network_name = "${module.azurerm_virtual_network.vnet_name}"
}

module "azurerm_kubernetes_cluster" {
  source              = "../modules/azurerm_kubernetes_cluster"
  cluster_name        = "${var.cluster_name}-${terraform.workspace}"
  pool_name           = "${lookup(var.tags, "Team")}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.arg.name}"
  dns_prefix          = "${var.dns_prefix}"
  ssh_public_key      = "${file("${var.ssh_public_key}")}"
  agent_count         = "${var.agent_count}"
  vm_size             = "${var.vm_size}"
  os_type             = "${var.os_type}"
  os_disk_size_gb     = "${var.os_disk_size_gb}"
  vnet_subnet_id      = "${module.azurerm_subnet.subnet_id}"
  client_id           = "${var.client_id}"
  client_secret       = "${var.client_secret}"
  network_plugin      = "${var.network_plugin}"
  tags = {
    Team = "${lookup(var.tags, "Team")}"
    Name = "${lookup(var.tags, "Name")}"
    Env  = "${terraform.workspace}"
  }
}
