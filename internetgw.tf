# Creating Internet Gateway 
resource "aws_internet_gateway" "practice_gateway" {
  vpc_id = aws_vpc.practice_vpc.id
}