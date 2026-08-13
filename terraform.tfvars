resource_map = {
  "config1" = {
    rg_name  = "my-resource-group-1"
    location = "East US"

    storage = {
      name = "mysgropstg13424"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }

    vnet = {
      name = "my-vnet-1"
      address_space = ["10.0.0.0/16"]
    }

    subnet = {
      name = "my-subnet-1"
      address_prefixes = ["10.0.1.0/24"]
    }

    nic = {
      name = "my-nic-1"
    }
  

  "config2" = {
    rg_nameaa = "my-resource-group-2"
    location = "West US"

    storage = {
      name = "mysgropstg56789"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }

    vnet = {
      name = "my-vnet-2"
      address_space = ["10.1.0.0/16"]
    }

    subnet = {
      name = "my-subnet-2"
      address_prefixes = ["10.1.1.0/24"]
    }

    nic = {
      name = "my-nic-2"
    }
  }
}

}
