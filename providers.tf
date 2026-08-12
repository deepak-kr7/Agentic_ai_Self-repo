terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "cicd_test"
    storage_account_name = "storagecicd12"
    container_name       = "cicdcontainer"
    key                  = "agenticailog.tfstate"
  }
}

provider "azurerm" {
  features {}
}
