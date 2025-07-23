provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-terraform-test-01"
  location = "japaneast"  # リージョンは必要に応じて変更
}
