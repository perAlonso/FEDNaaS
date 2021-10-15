# ---- General ---------------------------------------------
variable "name-prefix" {
  description = "Prefix of all resource names"
  type        = string
}

# ---- Key Pair --------------------------------------------
variable "keypair_public-path" {
  description = "Path to public SSH key"
  type        = string
}


