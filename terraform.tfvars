name_prefix = "group4-"

instance_user = "ubuntu"
num_clients_per_instance = 4

client_image_name    = "Ubuntu 20.04 - 2021.03.23"
client_flavor_name   = "ssc.xsmall"
reducer_image_name   = "Ubuntu 20.04 - 2021.03.23"
reducer_flavor_name  = "ssc.xsmall"
combiner_image_name  = "Ubuntu 20.04 - 2021.03.23"
combiner_flavor_name = "ssc.xsmall"

key_public_path  = "./private/group4-key.pub"
key_private_path = "./private/group4-key.pem"

external_network_id     = "9187404b-b24b-4ee5-b5f4-22d9a15dc4e2"
subnet_cidr             = "192.168.199.0/24"
router_destination_cidr = "10.0.1.0/24"
router_next_hop         = "192.168.199.254"
floating_ip_pool        = "Public External IPv4 Network"
