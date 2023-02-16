locals {
  app   = "ghost"
  label = "${local.app}-${var.environment}-vm-001"
  image = "linode/ubuntu22.10"
  type  = "g6-standard-1"
}

resource "linode_instance" "ghost_instance" {
  label           = local.label
  image           = local.image
  region          = var.default_region
  type            = local.type
  root_pass       = var.linux_root_password
  tags            = [var.environment, "Terraform", "K8S"]
  swap_size       = 256
}

resource "linode_domain_record" "tsc" {
    domain_id   = linode_domain.thesmartestcondo_domain.id
    name        = "www"
    record_type = "A"
    target      = linode_instance.ghost_instance.ip_address
}

resource "linode_domain_record" "tsc_no_www" {
    domain_id   = linode_domain.thesmartestcondo_domain.id
    name        = local.thesmartestcondo_domain
    record_type = "A"
    target      = linode_instance.ghost_instance.ip_address
}

resource "linode_domain_record" "tsc_admin" {
    domain_id   = linode_domain.thesmartestcondo_domain.id
    name        = "admin.${local.thesmartestcondo_domain}"
    record_type = "A"
    target      = linode_instance.ghost_instance.ip_address
}