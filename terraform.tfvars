name_prefix = "group4-"
instance_user = "ubuntu"
num_clients_per_instance = 5
num_client_instances = 2

client_image_name    = "Ubuntu 18.04"
client_flavor_name   = "ssc.medium"
reducer_image_name   = "Ubuntu 18.04"
reducer_flavor_name  = "ssc.medium"
combiner_image_name  = "Ubuntu 18.04"
combiner_flavor_name = "ssc.medium"

key_public_path  = "./private/group4-key.pub"
key_private_path = "./private/group4-key.pem"

network_id              = "e91303a0-9bfb-404c-84ec-07d6fbf8f33c"
floating_ip_pool        = "Public External IPv4 Network"
