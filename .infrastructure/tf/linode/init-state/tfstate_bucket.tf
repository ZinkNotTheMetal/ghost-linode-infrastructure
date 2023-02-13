locals {
  bucket_label = "wdz-tfstate"
}

data "linode_object_storage_cluster" "storage_cluster" {
  id = "us-southeast-1"
}

resource "linode_object_storage_bucket" "tfstate_bucket" {
  cluster = data.linode_object_storage_cluster.storage_cluster.id
  label   = local.bucket_label
}

output "tfstate_bucket_url" {
  value = linode_object_storage_bucket.tfstate_bucket.hostname
}

output "tfstate_bucket_label" {
  value = local.bucket_label
}