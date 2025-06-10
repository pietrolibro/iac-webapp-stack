####################################################
# Create a virtual network and a default subnet
####################################################
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
    resource_group_name = var.resource_group_name
    tags = {
    environment = "production"
    created_by  = "terraform"
    }
}

####################################################
# Create a default subnet within the virtual network
####################################################
resource "azurerm_subnet" "vnet_default_subnet" {
  name                 = "default"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  service_endpoints    = ["Microsoft.Web"]

  delegation {
    name = "webapp-delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action"
      ]
    }
  }
}