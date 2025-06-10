#Name of the Web App
output "webapp_name" {
  description = "The name of the web application."
  value       = azurerm_linux_web_app.webapp.name
}

output "webapp_id" {
  description = "The ID of the web application."
  value       = azurerm_linux_web_app.webapp.id
}

# Name of the App Service Plan
output "webapp_srv_plan_name" {
  description = "The name of the App Service Plan."
  value       = azurerm_app_service_plan.webapp_plan.name
}

# Url of the Web App
output "webapp_url" {
  description = "The URL of the web application."
  value       = azurerm_linux_web_app.webapp.default_hostname
}
# Identity ID of the Web App
output "webapp_identity_id" {
  description   = "The identity ID of the web application."
  value         = azurerm_linux_web_app.webapp.identity[0].principal_id
}
# Identity Type of the Web App
output "webapp_identity_type" {
  description = "The identity type of the web application."
  value         = azurerm_linux_web_app.webapp.identity[0].type
}
