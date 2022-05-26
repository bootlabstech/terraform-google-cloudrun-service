resource "google_cloud_run_service" "default" {
  name     = var.cloudrun_name
  location = var.cloudrun_location
  project   = var.project

  template {
    spec {
      containers {
        image = var.cloudrun_image
      }
    }
  }

  traffic {
    percent         = var.traffic_percent
    latest_revision = var.if_latest_revision
  }
}