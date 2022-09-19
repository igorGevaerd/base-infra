# base-infra
Base infra to be used as a model

### Requirements:
1. [Terraform cloud](https://cloud.hashicorp.com/) account;
2. AWS account (Account ID);

### Steps:
1. Terraform cloud account configured on the CLI (`terraform login`)
2. "Workspace" creation:
```tf
$ cd .terraform/aws/example-org/
$ terraform workspace new test 
$ terraform workspace list
```

> On TF cloud:
>
> ![image](https://user-images.githubusercontent.com/18078161/191110445-377d4641-b210-4383-8d72-4dc84a8244bb.png)

3. Change execution model on Terraform cloud from "Remote" to "Local":
> On the "workspace": Settings -> General
![image](https://user-images.githubusercontent.com/18078161/191112265-b7a50cc3-bd18-4b08-aaf9-8a989ab17ad8.png)
> And then save it!

4. `$ terraform init`
5. Execute `terraform plan` considering the environment/workspace:
```tf
$ terraform plan -var-file "./envs/terraform-$(terraform workspace show).tfvars"
Acquiring state lock. This may take a few moments...

Terraform used the selected providers to generate the following execution plan. Resource actions are
indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.vpc.module.vpc.aws_eip.nat[0] will be created
  + resource "aws_eip" "nat" {
      + allocation_id        = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = (known after apply)
      + id                   = (known after apply)
      + instance             = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Name"       = "example-dev-us-east-1a"
          + "managed-by" = "terraform"
          + "module"     = "VPC"
          + "project"    = "example"
          + "squad"      = "example"
          + "stage"      = "dev"
        }
      + tags_all             = {
          + "Name"       = "example-dev-us-east-1a"
          + "managed-by" = "terraform"
          + "module"     = "VPC"
          + "project"    = "example"
          + "squad"      = "example"
          + "stage"      = "dev"
        }
      + vpc                  = true
    }
...
...
...
...
  # module.vpc.module.vpc.aws_vpc.this[0] will be created
  + resource "aws_vpc" "this" {
      + arn                                  = (known after apply)
      + assign_generated_ipv6_cidr_block     = false
      + cidr_block                           = "10.104.64.0/18"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_classiclink                   = (known after apply)
      + enable_classiclink_dns_support       = (known after apply)
      + enable_dns_hostnames                 = false
      + enable_dns_support                   = true
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name"       = "example-dev"
          + "managed-by" = "terraform"
          + "module"     = "VPC"
          + "project"    = "example"
          + "squad"      = "example"
          + "stage"      = "dev"
        }
      + tags_all                             = {
          + "Name"       = "example-dev"
          + "managed-by" = "terraform"
          + "module"     = "VPC"
          + "project"    = "example"
          + "squad"      = "example"
          + "stage"      = "dev"
        }
    }

Plan: 20 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these
actions if you run "terraform apply" now.
```

6. Apply the changes:
```tf
$ terraform apply -var-file "./envs/terraform-$(terraform workspace show).tfvars" --auto-approve
```

### To-Dos:
* Put those steps on a pipeline (e.g.: https://learn.hashicorp.com/tutorials/terraform/github-actions);
* Review the approach of using `Roles`:
https://github.com/igorGevaerd/base-infra/blob/3a8687f26e1b67afabc8915f1c840a80c927cda5/.terraform/aws/example-org/envs/terraform-dev.tfvars#L15
