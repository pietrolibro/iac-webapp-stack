variable "AZ_IAC_WEBAPP_RESOURCE_GROUP_LOCATION" {
  description = "The Azure region where the resources will be deployed."
  type        = string
  default     = "switzerlandnorth"
}

variable "AZ_IAC_WEBAPP_RESOURCE_GROUP_NAME" {
  description = "The name of the resource group where the Azure resources will be created."
  type        = string
}

variable "AZ_IAC_WEBAPP_VNET_NAME" {
  description = "The name of the virtual network to be created."
  type        = string
  default     = "iac-webapp-vnet"
}

variable "AZ_IAC_WEBAPP" {
    description = "The name of the web application to be created."
    type        = string
    default     = "iac-webapp"
}
variable "AZ_IAC_WEBAPP_SRV_PLAN" {
    description = "The name of the App Service Plan for the web application."
    type        = string
    default     = "iac-webapp-srv-plan"
}