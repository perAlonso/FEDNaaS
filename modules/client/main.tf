terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.44.0"
    }
  }
}

# Create combiner instance.
resource "openstack_compute_instance_v2" "client" {
  name            = "${var.name-prefix}combiner"
  image_name      = "Ubuntu 20.04 - 2021.03.23"
  flavor_name     = "ssc.xsmall"
  key_pair        = var.key_pair
  security_groups = var.security_groups

  network {
    uuid = var.uuid
  }
}

# Associate floating IP to combiner.
resource "openstack_networking_floatingip_v2" "client" {
  pool = "Public External IPv4 Network"
}

resource "openstack_compute_floatingip_associate_v2" "client" {
  floating_ip = openstack_networking_floatingip_v2.client.address
  instance_id = openstack_compute_instance_v2.client.id
}

