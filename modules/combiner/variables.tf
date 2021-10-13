variable name-prefix {
  description = "Prefix given to resource names"
  type = string
}

variable key_pair {
  description = "Key pair to use"
  type = string
}

variable security_groups {
  description = "Security groups to attach"
  type = list(string)
}

variable uuid {
  description = "UUID of network to use"
  type = string
}
