resource "openstack_networking_secgroup_v2" "main_group" {
  name = var.secgroup_name
  description = "A simple security group opening up FEDn required ports"
}


resource "openstack_networking_security_group_rule_v2" "port_22" {
  ethertype = "IPv4"
  protocol = "tcp"
  direction = "ingress"
  security_group_id = resource.openstack_networking_secgroup_v2.main_group.id

  port_range_min = 22
  port_range_max = 22
  remote_ip_prefix = "0.0.0.0/0"
}


resource "openstack_networking_security_group_rule_v2" "port_8081" {
  ethertype = "IPv4"
  protocol = "tcp"
  direction = "ingress"
  security_group_id = resource.openstack_networking_secgroup_v2.main_group.id

  port_range_min = 8081 
  port_range_max = 8081
  remote_ip_prefix = "0.0.0.0/0"
}


resource "openstack_networking_security_group_rule_v2" "port_9000" {
  ethertype = "IPv4"
  protocol = "tcp"
  direction = "ingress"
  security_group_id = resource.openstack_networking_secgroup_v2.main_group.id

  port_range_min = 9000 
  port_range_max = 9000 
  remote_ip_prefix = "0.0.0.0/0"
}
