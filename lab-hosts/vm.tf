data "google_compute_image" "cwl-lab" {
  family    = "cwl-lab"
  project   = var.project_id
} 

resource "google_compute_instance" "lab-vm" {
  name         = "lab-instance-${count.index}"
  project      = var.project_id
  machine_type = "n1-standard-2"
  zone         = var.zone

  count = 3

  boot_disk {
    initialize_params {
      image = data.google_compute_image.cwl-lab.self_link
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

  tags = ["lab-vm", "allow-ping", "allow-ssh"]
}
