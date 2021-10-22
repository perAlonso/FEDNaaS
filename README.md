Running this project is simple. First enter the appropriate variable values in 
the terraform.tfvars file. The descriptions of these variables exists in variables.tf.

After this, the following sequence (standard for terraform) is run:
```
terraform init
terraform plan
terraform apply
(terraform destroy)
```
