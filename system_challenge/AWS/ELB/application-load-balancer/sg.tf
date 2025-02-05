resource "aws_security_group" "sg_web_alb_module" {
  depends_on = [aws_vpc.vpc_alb_module]

  vpc_id = aws_vpc.vpc_alb_module.id

  ingress {
    description = "SSH connection"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = [
      aws_vpc.vpc_alb_module.cidr_block,
      "0.0.0.0/0"
    ]
  }

  ingress {
    description = "HTTP"
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = [
      aws_vpc.vpc_alb_module.cidr_block,
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.vpc_alb_module.cidr_block, "0.0.0.0/0"]

  }

  tags = {
    Name    = var.name
    Project = var.project_name
  }
}