provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "Team2" {
  name     = "Team2-RG"
  location = "UK South"
}

resource "azurerm_network_security_group" "Team2"{
  name	   = "Team2sg"
  location = "UK South"
  resource_group_name = "Team2-RG"
  depends_on = [azurerm_resource_group.Team2]


security_rule{
  name 		= "Allow_SSH"
  priority 	= 1000
  direction 	= "Inbound"
  access 	= "Allow"
  protocol 	= "Tcp"
  source_port_range = "*"
  destination_port_range = "22"
  source_address_prefix = "*"
  destination_address_prefix = "*"
}
}
resource "azurerm_kubernetes_cluster" "Team2" {
  name                = "kube-cluster"
  location            = "UK South"
  resource_group_name = "Team2-RG"
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
