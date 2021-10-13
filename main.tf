terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.44.0"
    }
  }
}


resource "openstack_networking_secgroup_v2" "reducer_group" {
  name        = var.secgroup_name
  description = "A simple security group opening up FEDn required ports"
}


resource "openstack_networking_secgroup_rule_v2" "port_22" {
  ethertype         = "IPv4"
  protocol          = "tcp"
  direction         = "ingress"
  security_group_id = resource.openstack_networking_secgroup_v2.reducer_group.id

  port_range_min   = 22
  port_range_max   = 22
  remote_ip_prefix = "0.0.0.0/0"
}

data "template_file" "cloud_init_script" {
  template = file("cloud-cfg.txt")
}

resource "openstack_compute_instance_v2" "client" {
  count = var.reducers
  name  = format("${var.client_prefix}_%d", count.index)

  network {
    name = var.virtual_network_name
  }

  image_id        = var.image_id
  user_data       = data.template_file.cloud_init_script.rendered
  security_groups = [resource.openstack_networking_secgroup_v2.reducer_group.name]
  flavor_name     = var.client_flavor_name
  key_pair        = var.client_key_pair
}
