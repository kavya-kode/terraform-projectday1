resource "aws_lb" "app" {
  name               = "placemux-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.ecs_sg.id]

  subnets = [
    aws_subnet.dev.id,
    aws_subnet.staging.id,
    aws_subnet.prod.id
  ]
}

resource "aws_lb_target_group" "app" {
  name        = "placemux-tg"
  port        = 3000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.main.id

  health_check {
    path = "/"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}