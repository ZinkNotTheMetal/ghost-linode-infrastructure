locals {
  thesmartestcondo_domain = "thesmartestcondo.com"
}

# thesmartestcondo.com domain - purchased in GoDaddy
resource "linode_domain" "thesmartestcondo_domain" {
  type      = "master"
  domain    = local.thesmartestcondo_domain
  soa_email = local.personal_email
  tags      = ["GoDaddy", "Domain", "Terraform"]
}

output "tsc_domain" {
  value = local.thesmartestcondo_domain
}