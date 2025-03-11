terraform {
  cloud {

    organization = "vmoseng_certs"

    workspaces {
      name = "azure-state-container-deployer"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.21.1"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "=3.1.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
}