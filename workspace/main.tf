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

module "rg_module" {
  source = "./modules/rg"
}

module "storage_acc_module" {
  source = "./modules/vm"
  name_of_rg = module.rg_module.rg_name
  location_of_rg = module.rg_module.rg_location
}