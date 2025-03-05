########################################
# Account
########################################

variable "subscription_id" {
    type = string
    description = "Azure subscription ID to use"
    default = null
}

variable "tenant_id" {
    type = string
    description = "Azure tenant ID to use"
    default = null
}