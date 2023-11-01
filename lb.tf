# Creating  LoadBalancer
resource "aws_lb" "practice_lb" {
  name               = "practice-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.practice_sg.id]
  subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
}
resource "aws_lb_target_group" "practice_target" {
  name     = "practice-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.practice_vpc.id
}
resource "aws_lb_target_group_attachment" "practice_attach" {
  target_group_arn = aws_lb_target_group.practice_target.arn
  target_id        = aws_instance.practice_inst1.id
  port             = 80
  depends_on = [
    aws_instance.practice_inst1,
  ]
}
resource "aws_lb_target_group_attachment" "practice_attach1" {
  target_group_arn = aws_lb_target_group.practice_target.arn
  target_id        = aws_instance.practice_inst2.id
  port             = 80
  depends_on = [
    aws_instance.practice_inst2,
  ]
}
resource "aws_lb_listener" "practice_lbl" {
  load_balancer_arn = aws_lb.practice_lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.practice_target.arn
  }
}
