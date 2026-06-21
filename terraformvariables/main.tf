terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.1.0"
    } 
  }
  required_version = ">= 1.15.6"
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features {
    
  }
}

//input variables
variable "environment" {
  type = string
  description = "environment variable"
  default = "staging"
}

//output variables
output "storage_account_value" {
  value = azurerm_storage_account.example.name
}

//local variables
locals {
  environment = "prod"
  lob = "class"
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "nijeshanishstorage7"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = local.environment
  }
}