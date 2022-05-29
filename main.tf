resource "google_project_service" "vpcaccess-api" {
  project = var.project 
  service = "vpcaccess.googleapis.com"
}
# VPC access connector
resource "google_vpc_access_connector" "connector" {
  name          = var.connector_name
  provider      = google-beta
  region        = var.region
  network       = var.network
}

resource "google_cloud_run_service" "default" {
  name     = var.cloudrun_name
  location = var.cloudrun_location
  project   = var.project

  template {
    spec {
      containers {
        image = var.cloudrun_image
        resources {
        limits = {
         cpu = var.cloudrun_cpu
         memory = var.cloudrun_memory
        }
        }
      }
    }
  }
      metadata {
      annotations = {
        # Limit scale up to prevent any cost blow outs!
        "autoscaling.knative.dev/maxScale" = var.max_scale
        # Use the VPC Connector
        "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.name
        # all egress from the service should go through the VPC Connector
        "run.googleapis.com/vpc-access-egress" = var.egress_traffic
      }
    }
  }
