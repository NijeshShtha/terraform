terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.1.0"
    } 
  }
  required_version = ">= 1.15.6"
  backend "azurerm" {
      resource_group_name  = "statefilestoregroup"
      storage_account_name = "statefilestore30300"
      container_name       = "statefilecontainer"
      key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features {
    
  }
}

resource "azurerm_resource_group" "example" {
  name     = "statefilestoregroup"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "statefilestore30300"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

    tags = {
    environment = "staging"
  }
}