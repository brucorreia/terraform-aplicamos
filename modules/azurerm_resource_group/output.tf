output "aks_location" {
  value = "${azurerm_resource_group.aks.location}"
}

output "aks_name" {
  value = "${azurerm_resource_group.aks.name}"
}