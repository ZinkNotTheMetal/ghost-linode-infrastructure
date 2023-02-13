variable "pat_token" {
  description = "Linode API Personal Access Token"
  type        = string
}

variable "default_region" {
  description = "Linode default region for all resource being created"
  type        = string
}

variable "k8s_node_sku" {
  description = "The linode SKU for the Kubernetes pool machines"
  type = string
}

variable "k8s_node_count" {
  description = "The amount of pool machines to create in linode"
  type = number
}