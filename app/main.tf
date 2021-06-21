terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "=1.18.0"
    }
  }
}

provider "linode" {
}

resource "linode_lke_cluster" "myapp_cluster" {
  label       = "myapp"
  k8s_version = "1.21"
  region      = "ap-south"

  pool {
    type  = "g6-standard-1"
    count = 1
  }
}

output "cluster_id" {
  description = "Cluster Identifier"
  value       = linode_lke_cluster.myapp_cluster.id
}

output "api_endpoints" {
  description = "The endpoints for the Kubernetes API server"
  value       = linode_lke_cluster.myapp_cluster.api_endpoints
}

output "kubeconfig" {
  description = "Base64 encoded kubeconfig"
  value       = linode_lke_cluster.myapp_cluster.kubeconfig
  sensitive   = true
}
