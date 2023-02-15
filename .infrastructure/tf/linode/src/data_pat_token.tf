# Used for deploy-external-dns
output "pat_token" {
  value     = var.pat_token
  sensitive = true
}