output "app_credentials" {
  value = {
    app_id    = azuread_application.terraform_deployer.id
    password  = azuread_application_password.terraform_deployer.value
  }
  sensitive = true
}