output "workload_identity_pool_name" {
  description = "Full name of the Workload Identity Pool"
  value       = google_iam_workload_identity_pool.github.name
}

output "workload_identity_provider_name" {
  description = "Full name of the Workload Identity Pool Provider — used in GitHub Actions workflow"
  value       = google_iam_workload_identity_pool_provider.github.name
}

output "service_account_email" {
  description = "Email of the Terraform service account — used in GitHub Actions workflow"
  value       = google_service_account.terraform.email
}
