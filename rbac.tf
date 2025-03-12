data "azurerm_subscription" "primary" {
}

locals {
    subscription_id = data.azurerm_subscription.primary.id
}

resource "azurerm_role_definition" "terraform_deployer" {
  name        = var.terraform_deployer_role_name[0].name
  scope       = local.subscription_id
  description = var.terraform_deployer_role_name[0].description

  permissions {
    actions     = [
        "Microsoft.Resources/subscriptions/resourceGroups/read",
        "Microsoft.Resources/subscriptions/resourceGroups/write",
        "Microsoft.Storage/storageAccounts/read",
        "Microsoft.Storage/storageAccounts/write",
        "Microsoft.Storage/storageAccounts/listKeys/action",
        "Microsoft.Storage/storageAccounts/blobServices/read",
        "Microsoft.Storage/storageAccounts/blobServices/containers/read",
        "Microsoft.Storage/storageAccounts/blobServices/containers/write",
        "Microsoft.Storage/storageAccounts/fileServices/read",
        "Microsoft.Storage/storageAccounts/fileServices/write",
        "Microsoft.Storage/storageAccounts/fileServices/shares/read",
        "Microsoft.Storage/storageAccounts/blobServices/write"
        
    ]
    not_actions = [
        "Microsoft.Resources/subscriptions/resourceGroups/delete",
        "Microsoft.Storage/storageAccounts/delete",
        "Microsoft.Storage/storageAccounts/blobServices/containers/delete", 
    ]
  }

  assignable_scopes = [
    local.subscription_id,
  ]
}

resource "azurerm_role_assignment" "terraform_deployer" {
  scope              = local.subscription_id
  role_definition_id = azurerm_role_definition.terraform_deployer.role_definition_resource_id
  principal_id       = azuread_service_principal.terraform_deployer.object_id
}