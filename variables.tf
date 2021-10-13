variable "image_id" {
  type    = string
  default = "iffecce9c-4c76-4fdc-ad76-ad1cc614f34c"
}

variable "client_flavor_name" {
  type    = string
  default = "ssc.xsmall"
}

variable "client_key_pair" {
  type    = string
  default = "acc"
}

variable "virtual_network_name" {
  type    = string
  default = "UPPMAX 2021/1-5 Internal IPv4 Network"
}

variable "reducers" {
  type    = number
  default = 1
}

variable "secgroup_name" {
  type    = string
  default = "group4_sec_group"
}

variable "client_prefix" {
  type    = string
  default = "group4_red"
}
