# 1. Resource Group
resource "azurerm_resource_group" "rg" {
  for_each = var.brocked_resource_map

  name     = each.value.rg_name
  location = each.value.locations
}

# 2. Storage Account
resource "azurerm_storage_account" "st" {
  for_each = var.resource_map

  name                     = each.value.storage.name
  resource_group_name      = azurerm_resource_group.rg[each.key].name
  location                 = azurerm_resource_group.rg[each.key].location
  account_tier             = each.value.storage.account_tier
  account_replication_type = each.value.storage.account_replication_type


# 3. Virtual Network (VNet)
resource "azurerm_virtual_network" "vnet" {
  for_each = var.resource_map

  name                = each.value.vnet.name
  location            = azurerm_resource_group.rg[each.key].location
  resource_group_name = azurerm_resource_group.rg[each.key].name
  address_space       = each.value.vnet.address_space
}

# 4. Subnet
resource "azurerm_subnet" "subnet" {
  for_each = var.resource_map

  name                 = each.value.subnet.name
  resource_group_name  = azurerm_resource_group.rg[each.key].name
  virtual_network_name = azurerm_virtual_network.vnet[each.key].name
  address_prefixes     = each.value.subnet.address_prefixes
}

# 5. Network Interface (NIC)
resource "azurerm_network_interface" "nic" {
  for_each = var.resource_map

  name                = each.value.nic.name
  location            = azurerm_resource_group.rg[each.key].location
  resource_group_name = azurerm_resource_group.rg[each.key].name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
