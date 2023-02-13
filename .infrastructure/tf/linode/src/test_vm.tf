resource "linode_instance" "my_server" {
  label           = "my-server"
  image           = "linode/debian11"
  region          = var.default_region
  type            = "g6-nanode-1"
}