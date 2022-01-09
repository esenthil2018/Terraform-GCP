
# Create Vertex Training service account
resource "google_service_account" "training_sa" {
    project       = module.project-services.project_id
    account_id   = var.training_sa_name
    display_name = "MLops Terraform service account"
}

# Create Vertex Training SA role bindings
resource "google_project_iam_member" "training_sa_role_bindings" {
    project       = module.project-services.project_id
    for_each = toset(var.training_sa_roles)
    member   = "serviceAccount:${google_service_account.training_sa.email}"
    role     = "roles/${each.value}"
}

# Create Vertex Pipelines service account
resource "google_service_account" "pipelines_sa" {
    project       = module.project-services.project_id
    account_id   = var.pipelines_sa_name
    display_name = "MLOps Terraform Pieplines account name"
}

# Create Vertex Pipelines SA role bindings
resource "google_project_iam_member" "role_bindings" {
    project       = module.project-services.project_id
    for_each = toset(var.pipelines_sa_roles)
    member   = "serviceAccount:${google_service_account.pipelines_sa.email}"
    role     = "roles/${each.value}"
}
