variable "name_prefix" {
  description = "Prefix of all resource names"
  type        = string
}

variable "instance_user" {
  description = "Username for all instances"
  type        = string
}

variable "num_clients_per_instance" {
  description = "Amount of clients to run per instance"
  type        = number
}

variable "num_client_instances" {
  description = "Amount of instances to run clients on"
  type        = number
}

variable "client_image_name" {
  description = "Image to use for client instance(s)"
  type        = string
}

variable "client_flavor_name" {
  description = "Flavor to use for client instance(s)"
  type        = string
}

variable "reducer_image_name" {
  description = "Image to use for reducer instance"
  type        = string
}

variable "reducer_flavor_name" {
  description = "Flavor to use for reducer instance"
  type        = string
}

variable "combiner_image_name" {
  description = "Image to use for combiner instance(s)"
  type        = string
}

variable "combiner_flavor_name" {
  description = "Flavor to use for combiner instance(s)"
  type        = string
}

variable "key_public_path" {
  description = "Path to public SSH key"
  type        = string
}

variable "key_private_path" {
  description = "Path to private SSH key"
  type        = string
}

variable "network_id" {
  description = "ID of network to attach instances to"
  type        = string
}

variable "floating_ip_pool" {
  description = "Pool to get floating IPs from"
  type        = string
}
