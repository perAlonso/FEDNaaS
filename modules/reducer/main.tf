terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.44.0"
    }
  }
}

resource "openstack_compute_instance_v2" "reducer" {
  name            = "${var.name_prefix}reducer"
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  key_pair        = var.key_pair
  security_groups = var.security_groups

  network {
    uuid = var.uuid
  }
}

# Associate floating IP to combiner.
resource "openstack_networking_floatingip_v2" "reducer" {
  pool = var.floating_ip_pool
}

resource "openstack_compute_floatingip_associate_v2" "reducer" {
  floating_ip = openstack_networking_floatingip_v2.reducer.address
  instance_id = openstack_compute_instance_v2.reducer.id
}

