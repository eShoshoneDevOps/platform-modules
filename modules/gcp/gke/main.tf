resource "google_container_cluster" "primary" {
  name       = var.cluster_name
  project    = var.project_id
  location   = var.region
  network    = var.network
  subnetwork = var.subnetwork

  deletion_protection      = var.deletion_protection
  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pod_cidr_name
    services_secondary_range_name = var.services_cidr_name
  }

  release_channel {
    channel = "REGULAR"
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  resource_labels = var.labels
}

resource "google_container_node_pool" "pools" {
  for_each = { for np in var.node_pools : np.name => np }

  name     = each.value.name
  project  = var.project_id
  location = var.region
  cluster  = google_container_cluster.primary.name

  autoscaling {
    min_node_count = each.value.min_count
    max_node_count = each.value.max_count
  }

  node_config {
    machine_type = each.value.machine_type
    disk_size_gb = each.value.disk_size_gb
    preemptible  = each.value.preemptible

    workload_metadata_config {
      mode = "GKE_METADATA"
    }

    labels = var.labels
  }
}