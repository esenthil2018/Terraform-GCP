

locals {
    image_project = "deeplearning-platform-release"
}

data "google_compute_network" "vm_network" {
    project = module.project-services.project_id
    name    = var.network_name

    depends_on = [
        module.project-services
    ]
}

data "google_compute_subnetwork" "vm_subnetwork" {
    project = module.project-services.project_id
    name   = var.subnet_name
    region = var.subnet_region

    depends_on = [
        module.project-services
    ]
}

resource "google_notebooks_instance" "notebook_instance" {
    project          = module.project-services.project_id
    name             = "${var.name_prefix}-notebook"
    machine_type     = var.machine_type
    location         = var.zone

    network = data.google_compute_network.vm_network.id
    subnet  = data.google_compute_subnetwork.vm_subnetwork.id

    vm_image {
        project      = local.image_project
        image_family = var.image_family
    }

    dynamic accelerator_config {
      for_each = var.gpu_type != null ? [1] : []
      content {
          type = var.gpu_type
          core_count = var.gpu_count
      }
    }

    install_gpu_driver  = var.install_gpu_driver

    boot_disk_size_gb   = var.boot_disk_size
}
