terraform {
  backend "azurerm" {
    features {}
  }
}


provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "webapp_rg" {
  name     = var.AZ_IAC_WEBAPP_RESOURCE_GROUP_NAME
  location = var.AZ_IAC_WEBAPP_RESOURCE_GROUP_LOCATION

  tags = {
    environment = "production"
    created_by  = "terraform"
  }
}

module network {
  source = "./modules/network"

  resource_group_name = var.AZ_IAC_WEBAPP_RESOURCE_GROUP_NAME
  location            = var.AZ_IAC_WEBAPP_RESOURCE_GROUP_LOCATION
  vnet_name           = var.AZ_IAC_WEBAPP_VNET_NAME

  depends_on = [azurerm_resource_group.webapp_rg]
}

module app_service {
  source = "./modules/appservice"
  location            = var.AZ_IAC_WEBAPP_RESOURCE_GROUP_LOCATION
  resource_group_name = var.AZ_IAC_WEBAPP_RESOURCE_GROUP_NAME
  webapp_name         = var.AZ_IAC_WEBAPP
  appservice_plan     = var.AZ_IAC_WEBAPP_SRV_PLAN

  depends_on = [azurerm_resource_group.webapp_rg]
} 