resource_map = {
  "config1" = {
    rg_name  = "my-resource-group"
    location = "East US"

    storage = {
      name                     = "mysgropstg13424"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }

    vnet = {
      name          = "my-vnet"
      address_space = ["10.0.0.0/16"]
    }

    subnet = {
      name             = "my-subnet"
      address_prefixes = ["10.0.1.0/24"]
    }

    nic = {
      name = "my-nic"
    }
  }
}
