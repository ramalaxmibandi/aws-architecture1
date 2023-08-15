# Creating Route Table
resource "aws_route_table" "practice_route" {
  vpc_id = aws_vpc.practice_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.practice_gateway.id
  }
  tags = {
    Name = "practice-route"
  }
}
# Associating Route Table
resource "aws_route_table_association" "practice_rt1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.practice_route.id
}
# Associating Route Table
resource "aws_route_table_association" "practice_rt2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.practice_route.id
}