variable "instance_name" {
  description = "Name of instance"
  type        = string
}

variable "key_pair" {
  description = "Key pair to use"
  type        = string
}

variable "security_groups" {
  description = "Security groups to attach"
  type        = list(string)
}

variable "uuid" {
  description = "UUID of network to use"
  type        = string
}

variable "image_name" {
  description = "Name of image to use for instance"
  type        = string
}

variable "flavor_name" {
  description = "Name of flavor to use for instance"
  type        = string
}

variable "floating_ip_pool" {
  description = "Pool to get floating IPs from"
  type        = string
}

variable "pub_key" {
  description = "Public key as a path"
  type = string
}
