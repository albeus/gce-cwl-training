data "google_compute_image" "ubuntu" {
  family  = "ubuntu-1804-lts"
  project = "ubuntu-os-cloud"
} 

resource "google_compute_instance" "lab-vm" {
  name         = "lab-instance"
  project      = var.project_id
  machine_type = "n1-standard-2"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }

  network_interface {
    subnetwork         = data.terraform_remote_state.network.outputs.first_subnet_name
    subnetwork_project = var.project_id

    access_config {
      # Include this section to give the VM an external ip address
    }
  }

  metadata_startup_script =  ""

  tags = ["allow-ping", "allow-ssh"]
}
