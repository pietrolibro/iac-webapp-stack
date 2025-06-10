terraform {

  backend "azurerm" {
    features {}
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}


provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "random_string" "webapp_name_suffix" {
  length  = 30    # Set the length of the string
  lower   = true  # Use lowercase letters
  numeric = false  # Include numbers
  special = false # No special characters
  upper   = false # No uppercase letters
}

resource "random_integer" "webapp_srvplan_suffix" {
  min = 1000
  max = 9999
}


################################################
# Create a Resource Group for the Web App
################################################
resource "azurerm_resource_group" "webapp_rg" {
  name     = var.AZ_IAC_WEBAPP_RESOURCE_GROUP_NAME
  location = var.AZ_IAC_WEBAPP_RESOURCE_GROUP_LOCATION

  tags = {
    environment = "production"
    created_by  = "terraform"
  }
}

################################################
# Create a Virtual Network for the Web App
################################################
module network {
  source = "./modules/network"

  resource_group_name = var.AZ_IAC_WEBAPP_RESOURCE_GROUP_NAME
  location            = var.AZ_IAC_WEBAPP_RESOURCE_GROUP_LOCATION
  vnet_name           = var.AZ_IAC_WEBAPP_VNET_NAME

  depends_on = [azurerm_resource_group.webapp_rg]
}



#################################################
# Create an App Service Plan and Web App
#################################################
module app_service {
  source = "./modules/appservice"
  location            = var.AZ_IAC_WEBAPP_RESOURCE_GROUP_LOCATION
  resource_group_name = var.AZ_IAC_WEBAPP_RESOURCE_GROUP_NAME
  webapp_name         = "${var.AZ_IAC_WEBAPP}-${random_string.webapp_name_suffix.result}" 
  appservice_plan     = "${var.AZ_IAC_WEBAPP_SRV_PLAN}-${random_integer.webapp_srvplan_suffix.result}"

  depends_on = [azurerm_resource_group.webapp_rg]
} 

#################################################
# App Service Plan and Virtual Network Integration
#################################################
resource "azurerm_app_service_virtual_network_swift_connection" "webapp_vnet_integration" {

  app_service_id = module.app_service.webapp_id
  subnet_id      = module.network.subnet_id
  depends_on = [module.app_service]
}