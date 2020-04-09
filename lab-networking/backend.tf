terraform {
  backend "gcs" {
    bucket="bioexcel-cwl_state-bucket"
    prefix = "terraform/lab/network"
    credentials = "credentials.json"
  }
}
