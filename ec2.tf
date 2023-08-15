# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "practice_inst1" {
  ami                         = "ami-08a52ddb321b32a8c"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.practice_sg.id}"]
  subnet_id                   = aws_subnet.public-subnet-1.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  tags = {
    Name = "My Practice Instance1"
  }
}
# Creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "practice_inst2" {
  ami                         = "ami-0261755bbcb8c4a84"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.practice_sg.id}"]
  subnet_id                   = aws_subnet.public-subnet-2.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  tags = {
    Name = "My Practice Instance 2"
  }
}