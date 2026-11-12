terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0" //optional, specify the version of the provider you want to use
    }
  }
}

# provider "google" {
#   project = "gen-lang-client-0760529528"
#   region  = "us-central1"
#   zone    = "us-central1-c"
# }

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
} // run terraform init to initialize the provider and download the necessary plugins.


/////////////////////////////////////////
# resource 1  vpc network without subnets
resource "google_compute_network" "learning_vpc" { //rsrc_type rsrc_name
  name                    = "shubham-learning-vpc"
  auto_create_subnetworks = false //custom made
  description             = "VPC created using Terraform"
}

/////////////////
# vpc with subnet
resource "google_compute_subnetwork" "learning_subnet" {
  name          = "shubham-learning-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.learning_vpc.name
}

resource "google_compute_subnetwork" "learning_subnet2" {
  name          = "shubham-learning-subnet2"
  ip_cidr_range = "10.0.2.0/24"
  region        = var.region
  network       = google_compute_network.learning_vpc.name
}
//This is called Implicit Dependency in Terraform. 
//subnet dep on network, so we don't need to explicitly mention the dependency.

///////////////////
# resource 3 vm instance
resource "google_compute_instance" "vm_instance" {
  name         = "my-vm-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.learning_subnet.id
    access_config { 
    }
  }

}

////////////////
# resource bucket
resource "google_storage_bucket" "my_bucket" {
    name ="gen-lang-client-0760529528-learning-bucket"
    location = var.region
    force_destroy=true
}

