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
  }
}

provider "azurerm" {
  features {}

  # subscription_id and tenant_id is a secret variable configured in Terraform HCP
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id 
}