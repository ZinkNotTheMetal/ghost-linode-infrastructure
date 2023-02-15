variable "pat_token" {
  description = "Linode API Personal Access Token, located in ./linode/password.credentials"
  type        = string
}

variable "linux_root_password" {
  description = "Linux image root password, located in ./linode/password.credentials"
  type        = string
}

variable "default_region" {
  description = "Linode default region for all resource being created"
  type        = string
}

variable "environment" {}