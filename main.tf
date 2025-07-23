provider "azurerm" {
  features {}

  subscription_id = "6a018b75-55b5-4b68-960d-7328148568aa"
}


resource "azurerm_resource_group" "example" {
  name     = "rg-terraform-test-01"
  location = "japaneast"  # リージョンは必要に応じて変更
}
