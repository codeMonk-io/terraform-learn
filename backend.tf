terraform {
  backend "gcs" {
    bucket = "gen-lang-client-0760529528-terraform-state"
    prefix = "terraform/state"
  }
}

