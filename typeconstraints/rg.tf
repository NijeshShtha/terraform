resource "azurerm_resource_group" "example" {
  name     = "${var.environment}-resources"
  location = "West Europe"
}