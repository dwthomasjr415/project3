# This creates the route table for public subnet to get out to the internet
resource "aws_route_table" "t1-pubrt" {
  vpc_id = aws_vpc.t1-vpc.id
  route {
    cidr_block = var.destination_cidr_block
    gateway_id = aws_internet_gateway.t1-igw.id
  }
}
# This associates the public subnet 1 with the route table
resource "aws_route_table_association" "t1-pub1" {
    subnet_id = aws_subnet.t1-snpub1.id
    route_table_id = aws_route_table.t1-pubrt.id
}
# This associates the public subnet 2 with the route table
resource "aws_route_table_association" "t1-pub2"{ 
    subnet_id = aws_subnet.t1-snpub2.id
    route_table_id = aws_route_table.t1-pubrt.id
}