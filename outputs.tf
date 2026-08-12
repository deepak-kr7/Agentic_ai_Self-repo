output "resource_group_names" {
  value = { for k, v in azurerm_resource_group.rg : k => v.name }
}

output "storage_account_names" {
  value = { for k, v in azurerm_storage_account.st : k => v.name }
}

output "vnet_names" {
  value = { for k, v in azurerm_virtual_network.vnet : k => v.name }
}

output "subnet_names" {
  value = { for k, v in azurerm_subnet.subnet : k => v.name }
}

output "nic_names" {
  value = { for k, v in azurerm_network_interface.nic : k => v.name }
}
