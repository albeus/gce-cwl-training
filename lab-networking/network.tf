# # Create the network
resource "google_compute_network" "vpc" {
  name = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc-subnet1" {
  name          = "subnet1"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc.self_link
}
