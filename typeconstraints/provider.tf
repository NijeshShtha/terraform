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
  features {
    
  }
}