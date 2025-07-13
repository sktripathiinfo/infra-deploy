terraform {
  required_providers {
    azurerm={
        source = "hashicorp/azurerm"
        version = "4.36.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "7e2be9af-a66a-4901-a4da-58be3e80552c"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
