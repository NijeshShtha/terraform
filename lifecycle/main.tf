resource "azurerm_resource_group" "example" {
  lifecycle {
    create_before_destroy = true
    prevent_destroy = true
    precondition {
      condition = contains(var.resource_locations, var.resource_location)
      error_message = "Please enter a valid location"
    }
  }

  name     = "resourcerg2"
  location = var.resource_location
}

resource "azurerm_storage_account" "example" {
  lifecycle {
    ignore_changes = [ tags ]
    replace_triggered_by = [ azurerm_resource_group.example ]
  }
  name = "nijeshanishstorage117"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "dev"
  }
}