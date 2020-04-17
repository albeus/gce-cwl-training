variable "project_id" {
  description = "The project ID to deploy resources in"
}
variable "region" {
  description = "Default Region"
  default = "europe-west2"
} 
variable "zone" {
  description = "Default zone"
  default = "europe-west2-b"
} 

variable "hosts_number" {
  description = "The number of machines to create."
  default = 3
} 
