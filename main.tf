provider "azurerm" {
  features {}
}
 
resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group}"
  location = "${var.location}"
}
 
resource "azurerm_storage_account" "stor" {
  name                     = "${var.store_name}store${count.index}"
  location                 = "${var.location}"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  account_tier             = "${var.storage_account_tier}"
  account_replication_type = "${var.storage_replication_type}"
  count                    = 3
}
