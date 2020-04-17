output "instances_ips" {
  value = [ "${google_compute_instance.lab-vm.*.network_interface.0.access_config.0.nat_ip}" ] 
}

output "default_passwords" {
  value = zipmap(google_compute_instance.lab-vm.*.name, random_password.password.*.result)
}
