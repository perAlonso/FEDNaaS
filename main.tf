# ---- Provider --------------------------------------------
terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.44.0"
    }
  }
}

# Fetch credentials from environment variables.
provider "openstack" {}

# ---- Key Pair --------------------------------------------
resource "openstack_compute_keypair_v2" "keypair" {
  name       = "${var.name-prefix}keypair"
  public_key = "${file(var.keypair_public-path)}"
}

# ---- Security Group --------------------------------------
# TODO: Add ports as needed by services.
resource "openstack_networking_secgroup_v2" "secgroup" {
  description = "Open ports required by FEDnaaS"
  name        = "${var.name-prefix}secgroup"
}

resource "openstack_networking_secgroup_rule_v2" "rule_port22" {
  description       = "Allow SSH access"
  port_range_min    = 22
  port_range_max    = 22
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.secgroup.id}"
}


# ---- Combiner --------------------------------------------

# Create combiner instance.
data "template_file" "combiner_config" {
  template = file("./combiner-cfg.yaml")
}

resource "openstack_compute_instance_v2" "combiner" {
  name            = "${var.name-prefix}combiner"
  image_name      = "Ubuntu 20.04 - 2021.03.23"
  flavor_name     = "ssc.xsmall"
  key_pair        = "${openstack_compute_keypair_v2.keypair.name}"
  security_groups = ["${openstack_networking_secgroup_v2.secgroup.name}"]
  user_data       = data.template_file.combiner_config.rendered

  network {
    uuid = "${openstack_networking_network_v2.network.id}"
  }
}

# Associate floating IP to combiner.
resource "openstack_networking_floatingip_v2" "combiner" {
  pool = "Public External IPv4 Network"
}

resource "openstack_compute_floatingip_associate_v2" "combiner" {
  floating_ip = "${openstack_networking_floatingip_v2.combiner.address}"
  instance_id = "${openstack_compute_instance_v2.combiner.id}"
}
  

# ---- Network ---------------------------------------------

resource "openstack_networking_network_v2" "network" {
  name           = "${var.name-prefix}network"
  description    = "Private network for FEDnaaS"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  name = "${openstack_networking_network_v2.network.name}-subnet"
  network_id = "${openstack_networking_network_v2.network.id}"
  cidr       = "192.168.199.0/24"
  ip_version = 4
}

resource "openstack_networking_router_v2" "router" {
  name           = "${var.name-prefix}router"
  external_network_id = "9187404b-b24b-4ee5-b5f4-22d9a15dc4e2"
  admin_state_up = "true"
}

resource "openstack_networking_router_interface_v2" "router-interface" {
  router_id = "${openstack_networking_router_v2.router.id}"
  subnet_id = "${openstack_networking_subnet_v2.subnet.id}"
}


resource "openstack_networking_router_route_v2" "route" {
  depends_on       = [openstack_networking_router_interface_v2.router-interface]
  router_id        = "${openstack_networking_router_v2.router.id}"
  destination_cidr = "10.0.1.0/24"
  next_hop         = "192.168.199.254"
}
