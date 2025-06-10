# Name of the Web App
output "webapp_name" {
  description = "The name of the web application."
  value       = module.app_service.webapp_name
}

# Url of the Web App
output "webapp_url" {
  description = "The URL of the web application."
  value       = "https://${module.app_service.webapp_url}"
}

# Name of the App Service Plan
output "webapp_srv_plan_name" {
  description = "The name of the App Service Plan."
  value       = module.app_service.webapp_srv_plan_name
}

