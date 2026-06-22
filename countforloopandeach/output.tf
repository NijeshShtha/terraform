output "resouce_group" {
  value = {
    for k, rg in azurerm_resource_group.example: k => rg.name
  }
}

output "storage_name" {
  value = [for i in azurerm_storage_account.example: i.name]
}