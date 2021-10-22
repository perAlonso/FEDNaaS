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
  name       = "${var.name_prefix}keypair"
  public_key = file(var.key_public_path)
}

# ---- Security Group --------------------------------------
# TODO: Which are needed, and fix descriptions.
resource "openstack_networking_secgroup_v2" "secgroup" {
  description = "Open ports required by FEDnaaS"
  name        = "${var.name_prefix}secgroup"
}

resource "openstack_networking_secgroup_rule_v2" "rule_port22" {
  description       = "Allow SSH access"
  port_range_min    = 22
  port_range_max    = 22
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "rule_port80" {
  description       = "Allow SSH access"
  port_range_min    = 80
  port_range_max    = 80
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "rule_port443" {
  description       = "Allow SSH access"
  port_range_min    = 443
  port_range_max    = 443
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "rule_port3546" {
  description       = "Allow SSH access"
  port_range_min    = 3546
  port_range_max    = 3546
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "rule_port6534" {
  description       = "bleh"
  port_range_min    = 6534
  port_range_max    = 6534
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "rule_port8081" {
  description       = "MongoDB"
  port_range_min    = 8081
  port_range_max    = 8081
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "rule_port8090" {
  description       = "reducer"
  port_range_min    = 8090
  port_range_max    = 8090
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "rule_port9000" {
  description       = "minio"
  port_range_min    = 9000
  port_range_max    = 9000
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "rule_port9001" {
  description       = "minio API"
  port_range_min    = 9001
  port_range_max    = 9001
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "rule_port12080" {
  description       = "bleh"
  port_range_min    = 12080
  port_range_max    = 12080
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "rule_port12081" {
  description       = "bleh"
  port_range_min    = 12081
  port_range_max    = 12081
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "rule_port12082" {
  description       = "bleh"
  port_range_min    = 12082
  port_range_max    = 12082
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "rule_port12083" {
  description       = "bleh"
  port_range_min    = 12083
  port_range_max    = 12083
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "rule_port27017" {
  description       = "bleh"
  port_range_min    = 27017
  port_range_max    = 27017
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
}


# ---- Network ---------------------------------------------
resource "openstack_networking_network_v2" "network" {
  description    = "Private network for FEDnaaS"
  name           = "${var.name_prefix}network"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  name       = "${openstack_networking_network_v2.network.name}-subnet"
  network_id = openstack_networking_network_v2.network.id
  cidr       = var.subnet_cidr
  ip_version = 4
}

resource "openstack_networking_router_v2" "router" {
  name                = "${var.name_prefix}router"
  external_network_id = var.external_network_id
  admin_state_up      = "true"
}

resource "openstack_networking_router_interface_v2" "router-interface" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet.id
}


resource "openstack_networking_router_route_v2" "route" {
  depends_on       = [openstack_networking_router_interface_v2.router-interface]
  router_id        = openstack_networking_router_v2.router.id
  destination_cidr = "10.0.1.0/24"
  next_hop         = "192.168.199.254"
}

# ---- Modules ---------------------------------------------
module "combiner" {
  source           = "./modules/combiner"
  name_prefix      = var.name_prefix
  image_name       = var.combiner_image_name
  flavor_name      = var.combiner_flavor_name
  key_pair         = openstack_compute_keypair_v2.keypair.name
  security_groups  = ["${openstack_networking_secgroup_v2.secgroup.name}"]
  uuid             = openstack_networking_network_v2.network.id
  floating_ip_pool = var.floating_ip_pool
}

module "reducer" {
  source           = "./modules/reducer"
  name_prefix      = var.name_prefix
  image_name       = var.reducer_image_name
  flavor_name      = var.reducer_flavor_name
  key_pair         = openstack_compute_keypair_v2.keypair.name
  security_groups  = ["${openstack_networking_secgroup_v2.secgroup.name}"]
  uuid             = openstack_networking_network_v2.network.id
  floating_ip_pool = var.floating_ip_pool
}

module "client" {
  source           = "./modules/client"
  name_prefix      = var.name_prefix
  image_name       = var.client_image_name
  flavor_name      = var.client_flavor_name
  key_pair         = openstack_compute_keypair_v2.keypair.name
  security_groups  = ["${openstack_networking_secgroup_v2.secgroup.name}"]
  uuid             = openstack_networking_network_v2.network.id
  floating_ip_pool = var.floating_ip_pool
}

# ---- Combiner Setup --------------------------------------
data "template_file" "combiner" {
  template = file("./modules/combiner/settings-combiner.yaml")
  vars = {
    reducer_private_ip = "${module.reducer.private_ip}"
  }
}

resource "null_resource" "combiner" {
  depends_on = [
    module.combiner,
    null_resource.reducer
  ]

  connection {
    type        = "ssh"
    user        = var.instance_user
    private_key = file(var.key_private_path)
    host        = module.combiner.floating_ip
    agent       = false
  }

  provisioner "file" {
    content     = data.template_file.combiner.rendered
    destination = "/home/${var.instance_user}/settings-combiner.yaml"
  }

  provisioner "remote-exec" {
    script = "./modules/combiner/combiner_init.sh"
  }
}


# ---- Reducer Setup ---------------------------------------
data "template_file" "reducer_settings" {
  template = file("./modules/reducer/settings-reducer.yaml")
  vars = {
    reducer_private_ip = "${module.reducer.private_ip}"
  }
}

data "template_file" "reducer_extra_hosts" {
  template = file("./modules/reducer/extra-hosts-reducer.yaml")
  vars = {
    combiner_private_ip = "${module.combiner.private_ip}"
  }
}

resource "null_resource" "reducer" {
  depends_on = [
    module.reducer
  ]

  connection {
    type        = "ssh"
    user        = var.instance_user
    private_key = file(var.key_private_path)
    host        = module.reducer.floating_ip
    agent       = false
  }

  provisioner "file" {
    content     = data.template_file.reducer_settings.rendered
    destination = "/home/${var.instance_user}/settings-reducer.yaml"
  }

  provisioner "file" {
    content     = data.template_file.reducer_extra_hosts.rendered
    destination = "/home/${var.instance_user}/extra-hosts-reducer.yaml"
  }

  provisioner "remote-exec" {
    script = "./modules/reducer/reducer_init.sh"
  }
}


# ---- Client Setup ----------------------------------------
data "template_file" "client_extra_hosts" {
  template = file("./modules/client/extra-hosts-client.yaml")
  vars = {
    combiner_ip = "${module.combiner.private_ip}"
    reducer_ip  = "${module.reducer.private_ip}"
  }
}

data "template_file" "init_client" {
  template = file("./modules/client/init_client.sh")
  vars = {
    reducer_ip = "${module.reducer.private_ip}"
    num_clients_per_instance = var.num_clients_per_instance
  }
}

resource "null_resource" "client" {
  depends_on = [
    module.client,
    null_resource.combiner
  ]

  connection {
    type        = "ssh"
    user        = var.instance_user
    private_key = file(var.key_private_path)
    host        = module.client.floating_ip
    agent       = false
  }

  provisioner "file" {
    content     = data.template_file.client_extra_hosts.rendered
    destination = "/home/${var.instance_user}/extra-hosts-client.yaml"
  }

  provisioner "file" {
    source      = "./modules/client/Dockerfile"
    destination = "/home/${var.instance_user}/Dockerfile"
  }

  provisioner "file" {
    content     = data.template_file.init_client.rendered
    destination = "/home/${var.instance_user}/init_client.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x ~/init_client.sh",
      "~/init_client.sh"
    ]
  }
}
