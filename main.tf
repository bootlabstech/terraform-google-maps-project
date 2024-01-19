resource "google_project" "project" {
  name                = var.name
  project_id          = "${var.name}-${random_string.random.result}"
  folder_id           = var.folder_id
  billing_account     = var.billing_account
  auto_create_network = false

  timeouts {
    create = "20m" # Adjust the timeout as needed
  }

  lifecycle {
    ignore_changes = [auto_create_network]
  }
}

resource "random_string" "random" {
  length  = 6
  special = false
  lower   = true
  upper   = false
}

resource "google_project_service" "project" {
  for_each                   = toset(var.service_apis)
  project                    = google_project.project.project_id
  service                    = each.key
  disable_dependent_services = false
  disable_on_destroy         = true
  timeouts {
    create = "20m"
  }
}


# Change the billing account using Google Cloud SDK
resource "null_resource" "change_billing_account" {
  triggers = {
    project_id = google_project.project.project_id
  }
  provisioner "local-exec" {
    command = "gcloud beta billing projects link ${google_project.project.project_id} --billing-account ${var.maps_billing_account}"
  }

  depends_on = [google_project.project]
}


resource "google_apikeys_key" "apikey" {
  name         = var.apikeyname
  display_name = var.apikeyname
  project      = google_project.project.project_id

  # Geocoding API
  dynamic "restrictions" {
    for_each = var.use_geocoding ? [1] : []
    content {
      api_targets {
        service = "geocoding-backend.googleapis.com"
      }
      dynamic "browser_key_restrictions" {
        for_each = var.gecoding_restriction_type == "website" ? [1] : []
        content {
          allowed_referrers = var.gecoding_website
        }
      }
      dynamic "server_key_restrictions" {
        for_each = var.gecoding_restriction_type == "ip_ranges" ? [1] : []
        content {
          allowed_ips = var.gecoding_ip_ranges
        }
      }
    }
  }

  # Maps JavaScript API
  dynamic "restrictions" {
    for_each = var.use_javascript ? [1] : []
    content {
      api_targets {
        service = "maps-embed-backend.googleapis.com"
      }
      dynamic "browser_key_restrictions" {
        for_each = var.javascript_restriction_type == "website" ? [1] : []
        content {
          allowed_referrers = var.javascript_website
        }
      }
      dynamic "server_key_restrictions" {
        for_each = var.javascript_restriction_type == "ip_ranges" ? [1] : []
        content {
          allowed_ips = var.javascript_ip_ranges
        }
      }
    }
  }

  # Maps SDK for Android
  dynamic "restrictions" {
    for_each = var.use_sdk_for_andorid ? [1] : []
    content {
      api_targets {
        service = "maps-sdk-backend.googleapis.com"
      }
      dynamic "browser_key_restrictions" {
        for_each = var.mpas-sdk_restriction_type == "website" ? [1] : []
        content {
          allowed_referrers = var.mpas-sdk_website
        }
      }
      dynamic "server_key_restrictions" {
        for_each = var.mpas-sdk_restriction_type == "ip_ranges" ? [1] : []
        content {
          allowed_ips = var.mpas-sdk_ip_ranges
        }
      }
    }
  }

  # Distance Matrix API
  dynamic "restrictions" {
    for_each = var.use_distancematrix ? [1] : []
    content {
      api_targets {
        service = "distancematrix-backend.googleapis.com"
      }
      dynamic "browser_key_restrictions" {
        for_each = var.matrix_restriction_type == "website" ? [1] : []
        content {
          allowed_referrers = var.matrix_website
        }
      }
      dynamic "server_key_restrictions" {
        for_each = var.matrix_restriction_type == "ip_ranges" ? [1] : []
        content {
          allowed_ips = var.matrix_ip_ranges
        }
      }
    }
  }

  # Places API
  dynamic "restrictions" {
    for_each = var.use_places ? [1] : []
    content {
      api_targets {
        service = "places-backend.googleapis.com"
      }
      dynamic "browser_key_restrictions" {
        for_each = var.places_restriction_type == "website" ? [1] : []
        content {
          allowed_referrers = var.places_website
        }
      }
      dynamic "server_key_restrictions" {
        for_each = var.places_restriction_type == "ip_ranges" ? [1] : []
        content {
          allowed_ips = var.places_ip_ranges
        }
      }
    }
  }

  # Directions API
  dynamic "restrictions" {
    for_each = var.use_directions ? [1] : []
    content {
      api_targets {
        service = "directions-backend.googleapis.com"
      }
      dynamic "browser_key_restrictions" {
        for_each = var.directions_restriction_type == "website" ? [1] : []
        content {
          allowed_referrers = var.directions_website
        }
      }
      dynamic "server_key_restrictions" {
        for_each = var.directions_restriction_type == "ip_ranges" ? [1] : []
        content {
          allowed_ips = var.directions_ip_ranges
        }
      }
    }
  }

  # Cloud Datastore API
  dynamic "restrictions" {
    for_each = var.use_datastore ? [1] : []
    content {
      api_targets {
        service = "datastore.googleapis.com"
      }
      dynamic "browser_key_restrictions" {
        for_each = var.datastore_restriction_type == "website" ? [1] : []
        content {
          allowed_referrers = var.datastore_website
        }
      }
      dynamic "server_key_restrictions" {
        for_each = var.datastore_restriction_type == "ip_ranges" ? [1] : []
        content {
          allowed_ips = var.datastore_ip_ranges
        }
      }
    }
  }
  depends_on = [google_project.project]
  timeouts {
    create = "20m"
  }
}
