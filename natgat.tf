resource "aws_eip" "nat_gateway" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id = aws_subnet.public-subnet-1.id
  tags = {
    "Name" = "myNatGateway"
  }
}