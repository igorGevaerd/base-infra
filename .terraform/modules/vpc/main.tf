# link do module: https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/2.77.0
module "vpc" {
  source                  = "terraform-aws-modules/vpc/aws"
  version                 = "3.14.0"

  name                    = "${var.project}-${var.env}"
  cidr                    = var.cidr

  azs                     = var.azs
  private_subnets         = var.private_subnets
  public_subnets          = var.public_subnets

  enable_nat_gateway      = var.enable_nat_gateway
  single_nat_gateway      = var.single_nat_gateway
  one_nat_gateway_per_az  = var.one_nat_gateway_per_az
  
  create_igw              = var.create_igw

  tags                    = merge(local.tags)
}
