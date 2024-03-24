terraform {

  cloud {
    organization = "Cloud_Projects"
    workspaces {
      name = "coast2coast"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}


provider "azurerm" {
  features {}
}

