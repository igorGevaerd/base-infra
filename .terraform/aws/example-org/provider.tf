provider "aws" {
  region = var.aws_region
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs#assuming-an-iam-role
  # assume_role {
  #   role_arn = "arn:aws:iam::${var.aws_accountnumber}:role/provision"
  # }
}
