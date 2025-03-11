# data "azuread_domains" "vmoseng_certs" {
#   only_initial = true
# }

data "azuread_client_config" "vmoseng_certs" {}

resource "azuread_application" "terraform_deployer" {
  display_name = "terraform-deployer"
  owners       = [data.azuread_client_config.vmoseng_certs.object_id]

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph

    resource_access {
      id   = "b4e74841-8e56-480b-be8b-910348b18b4c" # Application.ReadWrite.OwnedBy
      type = "Role"
    }
  }
}

resource "azuread_service_principal" "terraform_deployer" {
  client_id                    = azuread_application.terraform_deployer.client_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.vmoseng_certs.object_id]
}