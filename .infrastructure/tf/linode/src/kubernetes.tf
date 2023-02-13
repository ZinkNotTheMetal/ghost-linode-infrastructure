locals {
  cluster_name = "Production Cluster"
  k8s_version  = "1.25"
}

resource "linode_lke_cluster" "linode_k8s_cluster" {
    label       = local.cluster_name
    k8s_version = local.k8s_version
    region      = var.default_region
    tags        = ["prod", "Terraform", "K8S"]

    pool {
        type  = var.k8s_node_sku
        count = var.k8s_node_count

        # autoscaler {
        #   min = 3
        #   max = 10
        # }
    }

  # Prevent the count field from overriding autoscaler-created nodes
  lifecycle {
    ignore_changes = [
      pool.0.count
    ]
  }
}

output "k8s_kubeconfig" {
  value = linode_lke_cluster.linode_k8s_cluster.kubeconfig
  sensitive = true
}