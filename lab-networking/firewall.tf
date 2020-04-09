resource "google_compute_firewall" "allow-ping" {
  name    = "allow-ping"
  network = google_compute_network.vpc.self_link

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-ping"]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-ssh"]
}
