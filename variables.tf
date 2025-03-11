########################################
# Account
########################################

# variable "subscription_id" {
#     type = string
#     description = "Azure subscription ID to use"
#     default = null
# }

# variable "terraform_deployer_role_name" {
#     type = string
#     description = "Terraform deployer role name"
#     default = null
# }

variable "terraform_deployer_role_name" {
  type = list(object({
    description = string
    name        = string
  }))
  default = null
}