module "vpc" {
  source                 = "terraform-aws-modules/vpc/aws"
  name                   = "t1-proj3VPC"
  cidr                   = "10.0.0.0/16"
  azs                    = ["us-east-1a", "us-east-1b"]
  private_subnets        = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets         = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true
  # Database
  # create_database_subnet_group       = false
  #create_database_subnet_route_table = false
  #database_subnets                   = ["10.0.151.0/24", "10.0.152.0/24"]
  #VPC DNS
  enable_dns_hostnames = true
  enable_dns_support   = true
  public_subnet_tags = {
    Type = "t1-proj3psubs"
  }
  private_subnet_tags = {
    Type = "t1-proj3prisubs"
  }
  tags = {
    Owner = "t1-proj3"
  }
  vpc_tags = {
    Name = "t1-proj3vpc"
  }
}

variable "tags" {
  type = map(string)
}