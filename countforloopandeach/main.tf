resource "azurerm_resource_group" "example" {
  for_each = var.rg
  name     = each.value
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  # count = 2
  # name                     = "nijeshanishstorage7${count.index}"
  name = "nijeshanishstorage117"
  for_each = var.rg
  resource_group_name      = each.value
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}