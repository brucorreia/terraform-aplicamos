resource "azurerm_kubernetes_cluster" "aks" {
    name                = "${var.cluster_name}"
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    dns_prefix          = "${var.dns_prefix}"

    linux_profile {
        admin_username = "azureuser"

        ssh_key {
            key_data = "${var.ssh_public_key}"
        }
    }

    agent_pool_profile {
        name            = "${var.pool_name}"
        count           = "${var.agent_count}"
        vm_size         = "${var.vm_size}"
        os_type         = "${var.os_type}"
        os_disk_size_gb = "${var.os_disk_size_gb}"

        vnet_subnet_id = "${var.vnet_subnet_id}"
    }

    service_principal {
        client_id     = "${var.client_id}"
        client_secret = "${var.client_secret}"
    }

    network_profile {
        network_plugin = "${var.network_plugin}"
    }

    role_based_access_control {
        enabled = true
    }
    tags      = {
      Team = "${lookup(var.tags, "Team")}"
      Name = "${lookup(var.tags, "Name")}"
      Env  = "${terraform.workspace}"
    }
}