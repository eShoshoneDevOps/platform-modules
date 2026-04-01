variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "github_org" {
  description = "GitHub organization name"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "service_account_id" {
  description = "ID for the Terraform service account"
  type        = string
  default     = "terraform-sa"
}

variable "roles" {
  description = "IAM roles to grant the service account"
  type        = list(string)
  default = [
    "roles/compute.admin",
    "roles/container.admin",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountUser",
    "roles/iam.workloadIdentityUser",
    "roles/storage.admin",
  ]
}
