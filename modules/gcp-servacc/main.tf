terraform {
  backend "gcs" {}
}

resource "google_service_account" "service_acc" {
  account_id   = var.service_acc_id
  display_name = var.service_acc_name
}

variable "service_acc_name" {
  type = string
}

variable "service_acc_id" {
  type = string

  validation {
    condition = (
      length(var.service_acc_id) >= 6 &&
      length(var.service_acc_id) <= 30 &&
      can(regex("[a-z]([-a-z0-9]*[a-z0-9])", var.service_acc_id))
    )
    error_message = <<EOT
The variable must be 6-30 characters long and match the regular expression:
[a-z]([-a-z0-9]*[a-z0-9])
EOT
  }
}

output "service_account_name" {
  value = provider::google::name_from_id(google_service_account.service_acc.id)
}