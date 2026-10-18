terraform {
  backend "azurerm" {
    resource_group_name  = "n10038749-tfstate-rg"
    storage_account_name = "n10038749prjstate"
    container_name       = "tfstate"
    key                  = "project.terraform.tfstate"
  }
}
