
resource "google_storage_bucket" "artifact_repo" {
    project       = module.project-services.project_id
    name          = "${var.name_prefix}-bucket"
    location      = local.region
    storage_class = local.bucket_type
    force_destroy = var.force_destroy
    uniform_bucket_level_access = true
}