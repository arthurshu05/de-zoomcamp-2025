terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.21.0"
    }
  }
}

provider "google" {
  project = "northern-hope-449003-i2"
  region  = "us-central1"
}


resource "google_storage_bucket" "demo-bucket" {
  # This should be global unique
  name          = "northern-hope-449003-i2-terra-bucket"
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
