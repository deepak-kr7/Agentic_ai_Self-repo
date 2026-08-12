variable "resource_map" {
  description = "Simple nested map for Azure infrastructure (RG, Storage, VNet, Subnet, NIC)"
  type = map(object({
    rg_name  = string
    location = string

    storage = object({
      name                     = string
      account_tier             = string
      account_replication_type = string
    })

    vnet = object({
      name          = string
      address_space = list(string)
    })

    subnet = object({
      name             = string
      address_prefixes = list(string)
    })

    nic = object({
      name = string
    })
  }))
}
