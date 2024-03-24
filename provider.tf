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
#  subscription_id = env("ARM_SUBSCRIPTION_ID")
#  client_id       = env("ARM_CLIENT_ID")
#  client_secret   = env("ARM_CLIENT_SECRET")
#  tenant_id       = env("ARM_TENANT_ID")
}

