variable "name" {
  type        = string
  description = "this name will be used as the project name"
}

variable "billing_account" {
  type        = string
  description = "The alphanumeric ID of the billing account this project belongs to. The user or service account performing this operation with Terraform must have at minimum Billing Account User privileges (roles/billing.user) on the billing account."
}

variable "folder_id" {
  type        = string
  description = "The numeric ID of the folder this project belongs to. Changing this forces a new project to be created. Only one of org_id or folder_id may be specified. If the org_id is specified then the project is created at the top level. Changing this forces the project to be migrated to the newly specified organization."
  default     = "301465382621"
}

variable "service_apis" {
  type        = list(string)
  description = "The list of apis to be enabled in the project"
  default     = ["serviceusage.googleapis.com", "compute.googleapis.com", "secretmanager.googleapis.com", "apikeys.googleapis.com"]
}

variable "apikey-name" {
  type        = string
  description = "Name of api key"
}

# Enable the API to use
variable "use_geocoding" {
  type        = bool
  description = "enable the API to use"
  default     = false
}
variable "use_javascript" {
  type        = bool
  description = "enable the API to use"
  default     = false
}
variable "use_sdk_for_andorid" {
  type        = bool
  description = "enable the API to use"
  default     = false
}
variable "use_distancematrix" {
  type        = bool
  description = "enable the API to use"
  default     = false
}
variable "use_places" {
  type        = bool
  description = "enable the API to use"
  default     = false
}
variable "use_directions" {
  type        = bool
  description = "enable the API to use"
  default     = false
}
variable "use_datastore" {
  type        = bool
  description = "enable the API to use"
  default     = false
}



# Allow the whitelist ip ranges to use API
variable "gecoding_ip_ranges" {
  type        = list(string)
  description = "allow the whitelist ip ranges to use API"
  default     = [""]
}
variable "gecoding_website" {
  type        = list(string)
  description = "allow the whitelist website ranges to use API"
  default     = [""]
}

variable "javascript_ip_ranges" {
  type        = list(string)
  description = "allow the whitelist ip ranges to use API"
  default     = [""]
}
variable "javascript_website" {
  type        = list(string)
  description = "allow the whitelist website ranges to use API"
  default     = [""]
}

variable "mpas-sdk_ip_ranges" {
  type        = list(string)
  description = "allow the whitelist ip ranges to use API"
  default     = [""]
}
variable "mpas-sdk_website" {
  type        = list(string)
  description = "allow the whitelist website ranges to use API"
  default     = [""]
}

variable "matrix_ip_ranges" {
  type        = list(string)
  description = "allow the whitelist ip ranges to use API"
  default     = [""]
}
variable "matrix_website" {
  type        = list(string)
  description = "allow the whitelist website ranges to use API"
  default     = [""]
}

variable "places_ip_ranges" {
  type        = list(string)
  description = "allow the whitelist ip ranges to use API"
  default     = [""]
}
variable "places_website" {
  type        = list(string)
  description = "allow the whitelist website ranges to use API"
  default     = [""]
}

variable "directions_ip_ranges" {
  type        = list(string)
  description = "allow the whitelist ip ranges to use API"
  default     = [""]
}
variable "directions_website" {
  type        = list(string)
  description = "allow the whitelist website ranges to use API"
  default     = [""]
}

variable "datastore_ip_ranges" {
  type        = list(string)
  description = "allow the whitelist ip ranges to use API"
  default     = [""]
}
variable "datastore_website" {
  type        = list(string)
  description = "allow the whitelist website ranges to use API"
  default     = [""]
}


variable "gecoding_restriction_type" {
  type        = string
  description = "Restrict website or ip ranges for API"
  default     = ""
}

variable "javascript_restriction_type" {
  type        = string
  description = "Restrict website or ip ranges for API"
  default     = ""
}

variable "mpas-sdk_restriction_type" {
  type        = string
  description = "Restrict website or ip ranges for API"
  default     = ""
}

variable "matrix_restriction_type" {
  type        = string
  description = "Restrict website or ip ranges for API"
  default     = ""
}

variable "places_restriction_type" {
  type        = string
  description = "Restrict website or ip ranges for API"
  default     = ""
}

variable "directions_restriction_type" {
  type        = string
  description = "Restrict website or ip ranges for API"
  default     = ""
}

variable "datastore_restriction_type" {
  type        = string
  description = "Restrict website or ip ranges for API"
  default     = ""
}

variable "maps_billing_account" {
  type = string
  description = "(optional) describe your variable"
}