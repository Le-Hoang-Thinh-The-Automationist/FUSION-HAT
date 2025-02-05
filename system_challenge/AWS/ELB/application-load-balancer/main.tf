resource "aws_alb" "alb_module" {
  name            = "alb"
  internal        = false
  security_groups = [aws_security_group.sg_web_alb_module.id]
  subnets = [
    aws_subnet.public_subnet_alb_module_az1.id,
    aws_subnet.public_subnet_alb_module_az2.id,

  ]
  tags = {
    Name = var.name
  }
}

resource "aws_alb_listener" "listener_alb_module" {
  load_balancer_arn = aws_alb.alb_module.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.instance_tg_alb_module.arn
    # target_id = aws
  }

  tags = {
    Name = var.name
  }

}

resource "aws_alb_listener_rule" "listener_HTTP_port_alb_module" {
  listener_arn = aws_alb_listener.listener_alb_module.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.instance_tg_alb_module.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }

}

resource "aws_alb_target_group" "instance_tg_alb_module" {
  name        = "alb"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.vpc_alb_module.id


  tags = {
    Name = var.name
  }
}

resource "aws_alb_target_group_attachment" "attach_instance_to_target_group_alb_module" {
  target_group_arn = aws_alb_target_group.instance_tg_alb_module.arn
  target_id        = aws_instance.ec2_instance_web_alb_module.id
  port             = 80

  depends_on = [
    aws_alb_target_group.instance_tg_alb_module,
    aws_instance.ec2_instance_web_alb_module
  ]
}