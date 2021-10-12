terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.44.0"
    }
  }
}

module "security_group" {
  source        = "./modules/"
  secgroup_name = "group4-secgroup"
}
