output "project_id" {
  value = var.project_id
}
output "id" {
  value = google_compute_subnetwork.learning_subnet.id
}

output "region" {
  value = var.region
}
// run terraform output to see the values of the outputs defined in this file.
output "zone" {
  value = var.zone
}

