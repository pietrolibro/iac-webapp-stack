output subnet_id {
  description = "The ID of the subnet."
  value       = azurerm_subnet.vnet_default_subnet.id
}
output vnet_id {
  description = "The ID of the virtual network."
  value       = azurerm_virtual_network.vnet.id
}
output vnet_name {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.vnet.name
}
output subnet_name {
  description = "The name of the default subnet."
  value       = azurerm_subnet.vnet_default_subnet.name
}