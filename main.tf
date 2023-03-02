# This is to create the VPC
resource "aws_vpc" "t1-vpc" {
    cidr_block =  var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
}

# This creates the Internet Gateway
resource "aws_internet_gateway" "t1-igw" {
  vpc_id = aws_vpc.t1-vpc.id
}


# This creates the first public subnet in AZ1 (subnet 1)
resource "aws_subnet" "t1-snpub1" {
    vpc_id = aws_vpc.t1-vpc.id
    availability_zone = var.AZ1
    cidr_block = var.subnet1_cidr_block
}
# This creates the second public subnet is AZ2 (subnet 2)
resource "aws_subnet" "t1-snpub2" {
    vpc_id = aws_vpc.t1-vpc.id
    availability_zone = var.AZ2
    cidr_block = var.subnet2_cidr_block
}
# This creates the first private subnet in AZ1 for the Web App Instances (subnet 3)
resource "aws_subnet" "t1-snpr1" {
    vpc_id = aws_vpc.t1-vpc.id
    availability_zone = var.AZ1
    cidr_block = var.subnet3_cidr_block
}
# This creates the second private subnet in AZ1 for MySql DB (subnet 4)
resource "aws_subnet" "t1-snpr2" {
    vpc_id = aws_vpc.t1-vpc.id
    availability_zone = var.AZ1
    cidr_block = var.subnet4_cidr_block
}