
variable "project_id" {
    description = "MLOps-Terraform Project"
    type        = string
}

variable "region" {
    description = "The region for the GCS bucket"
    type        = string
    default     = null
}

variable "zone" {
    description = "The zone for a Vertex Notebook instance"
    type        = string
}

variable "name_prefix" {
    description = "The name prefix to add to the resource names"
    type        = string
}

variable "machine_type" {
    description = "The Notebook instance's machine type"
    type        = string
}

variable "network_name" {
  description = "The network name for the Notebook instance"
  type        = string
  default     = "default"
}

variable "subnet_name" {
  description = "The subnet name for the Notebook instance"
  type        = string
  default     = "default"
}

variable "subnet_region" {
    description = "The region for the Notebook subnet"
    type        = string
    default     = "us-west1"
}

variable "boot_disk_size" {
    description = "The size of the boot disk"
    default     = 200
}

variable "image_family" {
    description = "A Deep Learning image family for the Notebook instance"
    type        = string
    default     = "common-cpu"
}

variable "gpu_type" {
    description = "A GPU type for the Notebook instance"
    type        = string
    default     = null
}

variable "gpu_count" {
    description = "A GPU count for the Notebook instance"
    type        = string
    default     = null
}

variable "install_gpu_driver" {
    description = "Whether to install GPU driver"
    type        = bool
    default     = true
}

variable "force_destroy" {
    description = "Whether to remove the bucket on destroy"
    type        = bool
    default     = false
}

variable "training_sa_roles" {
  description = "The roles to assign to the Vertex Training service account"
  default = [
    "storage.admin",
    "aiplatform.user",
    "bigquery.admin"
    ] 
}

variable "pipelines_sa_roles" {
  description = "The roles to assign to the Vertex Pipelines service account"
  default = [    
    "storage.admin", 
    "bigquery.admin", 
    "aiplatform.user"
  ]
}

variable "training_sa_name" {
    description = "Vertex training service account name."
    default = "training-sa"
}

variable "pipelines_sa_name" {
    description = "Vertex pipelines service account name."
    default = "pipelines-sa"
}

variable "cluster_name" {
  description = "The name for the GKE cluster"
  default     = "MLOpsGKE"
}
variable "env_name" {
  description = "The environment for the GKE cluster"
  default     = "Production"
}

variable "network" {
  description = "The VPC network created to host the cluster in"
  default     = "MLOpsGKE-network"
}
variable "subnetwork" {
  description = "The subnetwork created to host the cluster in"
  default     = "MLOpsGKE-subnet"
}
variable "pods_name" {
  description = "pods name"
  default     = "gke-terrform-pod"
}
variable "services_name" {
  description = "services name"
  default     = "gke-terraform-service"
}
