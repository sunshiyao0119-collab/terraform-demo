terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
    project = "project-1a9278a2-ef70-4989-9b1"
    region  = "us-central1"
}


resource "google_storage_bucket" "demo-bucket" {
  name          = "project-1a9278a2-ef70-4989-9b1-terra-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

