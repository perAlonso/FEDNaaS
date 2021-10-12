data "template_file" "cloud_init_script" {
  template = file("/path/to/cloud/init/script")
}

resource "openstack_compute_instance_v2" "client" {
  count = var.n_o_client
  name = format("${var.client_prefix}_%d", count.index)

  network {
    name = var.virtual_network_name
  }

  image_id = var.image_id
  user_data = data.template_file.cloud_init_script.rendered
  security_groups = [var.secgroup_name]
  flavor_name = var.client_flavor_name
  key_pair = var.client_key_pair
}
