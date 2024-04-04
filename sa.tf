# resource "azurerm_resource_group" "rg_asc" {
#  name     = "compte_sto"
#  location = "eastus"
#}

resource "azurerm_storage_account" "sa_asc" {
  name                     = "clemsvenad123456"
  resource_group_name      = azurerm_resource_group.rg_asc.name
  location                 = azurerm_resource_group.rg_asc.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
