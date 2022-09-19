terraform {
  backend "remote" {
    organization = "igev-company"
    workspaces {
      prefix = "env-"
    }
  }
}

module "vpc" {
  source                 = "../../modules/vpc"
  azs                    = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  cidr                   = var.cidr
  private_subnets        = var.private_subnets
  public_subnets         = var.public_subnets
  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  create_igw             = var.create_igw
  project                = var.project
  env                    = var.env
  squad                  = var.squad
  aws_region             = var.aws_region

  tags = local.tags
}