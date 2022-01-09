
terraform {
  required_version = ">= 0.14"
  required_providers {
    google = "~> 3.6"
  }
}

provider "google" {
    project = var.project_id 
}

data "google_project" "project" {
    project_id = var.project_id    
}

locals {
    bucket_type = "REGIONAL"
    region = var.region == null ? var.subnet_region : var.region
}

data "google_compute_zones" "available" {
}
