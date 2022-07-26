# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
    } 
  }
}

provider "azurerm" {
  features {}
}
