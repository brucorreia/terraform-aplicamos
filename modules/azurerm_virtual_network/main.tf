resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  address_space       = ["${var.address_space}"]
  tags = {
      Env     = "${lookup(var.tags, "Env")}"
      Name    = "${lookup(var.tags, "Name")}"
      Team    = "${lookup(var.tags, "Team")}"
  }
}