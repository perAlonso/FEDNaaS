output "floating_ip" {
  value = openstack_networking_floatingip_v2.reducer.address
}

output "private_ip" {
  value = openstack_compute_instance_v2.reducer.network[0].fixed_ip_v4
}
