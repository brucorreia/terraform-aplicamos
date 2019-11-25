resource "azurerm_resource_group" "aks" {
    name     = "${var.name}"
    location = "${var.location}"

    tags = {
        Env     = "${lookup(var.tags, "Env")}"
        Name    = "${lookup(var.tags, "Name")}"
        Team    = "${lookup(var.tags, "Team")}"
    }
}