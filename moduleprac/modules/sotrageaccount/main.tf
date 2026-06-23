resource "azurerm_storage_account" "exampleacc" {
  name = "nijeshanishstorage1177"
  resource_group_name      = var.rg_name
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "dev"
  }
}