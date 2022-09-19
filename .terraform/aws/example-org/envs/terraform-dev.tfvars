env                    = "dev"
cidr                   = "10.104.64.0/18"
private_subnets        = ["10.104.64.0/20", "10.104.80.0/20", "10.104.96.0/20"]
public_subnets         = ["10.104.112.0/22", "10.104.116.0/22", "10.104.120.0/22"]
enable_nat_gateway     = true
single_nat_gateway     = true
create_igw             = true
one_nat_gateway_per_az = false
# 10.104.60.0/22 -> available

aws_region = "us-east-1"
project    = "example"
squad      = "example"
