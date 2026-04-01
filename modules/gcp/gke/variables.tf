variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "zones" {
  description = "Zones for node pool distribution"
  type        = list(string)
}

variable "network" {
  description = "Self link of the VPC network"
  type        = string
}

variable "subnetwork" {
  description = "Self link of the subnet"
  type        = string
}

variable "pod_cidr_name" {
  description = "Name of the secondary range for pods"
  type        = string
}

variable "services_cidr_name" {
  description = "Name of the secondary range for services"
  type        = string
}

variable "node_pools" {
  description = "List of node pool configurations"
  type        = list(any)
}

variable "labels" {
  description = "Labels applied to all resources"
  type        = map(string)
  default     = {}
}

variable "deletion_protection" {
  description = "Whether Terraform will be prevented from destroying the cluster"
  type        = bool
  default     = true
}