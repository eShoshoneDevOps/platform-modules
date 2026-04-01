variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region to deploy into"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC to create"
  type        = string
}

variable "subnet_cidr" {
  description = "Primary CIDR for the subnet — where nodes live"
  type        = string
}

variable "pod_cidr" {
  description = "Secondary CIDR for GKE pods"
  type        = string
}

variable "services_cidr" {
  description = "Secondary CIDR for GKE services"
  type        = string
}

variable "labels" {
  description = "Labels applied to all resources"
  type        = map(string)
  default     = {}
}