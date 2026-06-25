variable "tags_environment" {
  description = "for storage account environment tag"
  type = map(string)
  default = {
    "dev" = "dev environment"
    "staging" = "staging environment"
    "prod" = "prod environment"
  }
}

variable "resource_group_location" {
  description = "for resource group location based on environment tags"
  type = map(string)
  default = {
    "dev" = "West Europe"
    "staging" = "Central US"
    "prod" = "West US"
  }
}

variable "name_based_on_workspace" {
  description = "name for resource based on workspace environment"
  type = map(string)
  default = {
    "dev" = "dev"
    "staging" = "sta"
    "prod" = "pro"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "nijeshanishstorage117${lookup(var.name_based_on_workspace, terraform.workspace, "default")}"
  resource_group_name      = var.name_of_rg
  location                 = var.location_of_rg
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = lookup(var.tags_environment, terraform.workspace, "default environment")
  }
}