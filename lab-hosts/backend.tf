terraform {
  backend "gcs" {
    bucket = "bioexcel-cwl_state-bucket"
    prefix = "terraform/lab/vm"
    credentials = "credentials.json"
  }
}

data "terraform_remote_state" "network" {
  backend = "gcs"

  config = {
    bucket  = "bioexcel-cwl_state-bucket"
    prefix  = "terraform/lab/network"
    credentials = "credentials.json"
  }
}
