output "floating_ip" {
  value = openstack_networking_floatingip_v2.combiner.address
}

output "private_ip" {
  value = openstack_compute_instance_v2.combiner.network[0].fixed_ip_v4
}
