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
    "staging" = "staging"
    "prod" = "prod"
  }
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources${lookup(var.name_based_on_workspace, terraform.workspace, "default")}"
  location = lookup(var.resource_group_location, terraform.workspace, "East US")
}