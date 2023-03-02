variable "vpc_cidr" {
    type = string
    description = "my VPC CIDR block"
}

variable "tags" {
    type = map(string)
}

variable "AZ1" {
    type = string
    description = "Availability Zone 1"
}
variable "AZ2" {
    type = string
    description = "Availability Zone 2"
}

variable "subnet1_cidr_block" {
    type = string
    description = "Public Subnet 1 Cidr Block"
}

variable "subnet2_cidr_block" {
    type = string
    description = "Public Subnet 2 Cidr Block"
}

variable "subnet3_cidr_block" {
    type = string
    description = "Private Subnet 1 Cidr Block"
}

variable "subnet4_cidr_block" {
    type = string
    description = "Private Subnet 2 Cidr Block"
}