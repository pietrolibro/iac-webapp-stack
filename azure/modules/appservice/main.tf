resource "azurerm_app_service_plan" "plan" {
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
  service_plan_id     = azurerm_app_service_plan.plan.id

  identity {
    type = "SystemAssigned"
  }

  site_config {
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}

output "webapp_identity_id" {
  value = azurerm_linux_web_app.webapp.identity[0].principal_id
}

output "webapp_url" {
  value = azurerm_linux_web_app.webapp.default_hostname
}
