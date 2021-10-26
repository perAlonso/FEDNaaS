# FEDn-as-a-Service
A Terraform-based solition for deploying [FEDn](https://github.com/scaleoutsystems/fedn) to an OpenStack cloud.

## Instructions
1. If needed, generate an SSH key pair to be used.
1. Edit the file `terraform.tfvars` to match your desires.
1. Source your OpenStack RC file (holding your user credentials).
1. Now you are ready to deploy by standing in the root folder and issuing:
```
terraform init
terraform apply
```
1. (Optional) Tear down all infrastructure by issuing:
```
terraform destroy
```

## Scaling
Scaling is achieved by editing the `num_clients_per_instance` and `num_client_instances` variables, varying the amount of clients to deploy. This can be done before and after the service has been deployed.
