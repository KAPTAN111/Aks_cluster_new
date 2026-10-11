terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.71.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "xxxxxxxxxxxoooo00000"
  # Configuration options
}
