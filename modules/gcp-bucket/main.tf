terraform {
  backend "gcs" {}
}

resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.region
}

variable "bucket_name" {
  description = "The name of the GCS bucket"
  type        = string
}

variable "region" {
  description = "The region for the GCS bucket"
  type        = string
}