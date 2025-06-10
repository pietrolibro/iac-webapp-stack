resource "azurerm_app_service_plan" "webapp_plan" {
  name                = var.webapp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = "Standard"
    size = "S1"
  }
  kind     = "Linux"
  reserved = true
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.webapp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_app_service_plan.webapp_plan.id

  identity {
    type = "SystemAssigned"
  }

  site_config {
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}