variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
}

# variable "source" {
#   description = "The source of the provider"
#   type        = string
# }

//describes the type of variable and provides a description for it. 
//The type is set to string, which means that the variable can only accept string values. 
//The description provides context for what the variable represents, in this case, the GCP project ID.