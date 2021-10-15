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
data "template_file" "reducer_config" {
  template = file("${path.module}/cloud-cfg.yaml")
}

resource "openstack_compute_instance_v2" "reducer" {
  name            = "${var.name-prefix}reducer"
  image_name      = "Ubuntu 20.04 - 2021.03.23"
  flavor_name     = "ssc.xsmall"
  key_pair        = var.key_pair
  security_groups = var.security_groups
  user_data       = data.template_file.reducer_config.rendered

  network {
    uuid = var.uuid
  }
}

# Associate floating IP to combiner.
resource "openstack_networking_floatingip_v2" "reducer" {
  pool = "Public External IPv4 Network"
}

resource "openstack_compute_floatingip_associate_v2" "reducer" {
  floating_ip = openstack_networking_floatingip_v2.reducer.address
  instance_id = openstack_compute_instance_v2.reducer.id
}

