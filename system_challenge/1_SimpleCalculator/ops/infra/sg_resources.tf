resource "aws_security_group" "public_fe_web_sg" {
  name   = "public_web_sg"
  vpc_id = aws_vpc.vpc_system_challenge_1.id

  ingress {
    description = "Deploy port for Front end"
    from_port   = var.fe_port
    to_port     = var.fe_port
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc_system_challenge_1.cidr_block, "0.0.0.0/0"]
  }

  ingress {
    description = "SSH port for connection"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc_system_challenge_1.cidr_block, "0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.vpc_system_challenge_1.cidr_block, "0.0.0.0/0"]
  }

  tags = {
    Name = "SG for Frontend Web"
    Project = var.project_name
  }
}

resource "aws_security_group" "private_be_application_sg" {
  name   = "private_application_sg"
  vpc_id = aws_vpc.vpc_system_challenge_1.id

  ingress {
    description = "Deploy port for Front end"
    from_port   = var.be_port
    to_port     = var.be_port
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc_system_challenge_1.cidr_block, "0.0.0.0/0"]
    # security_groups = [aws_security_group.public_fe_web_sg.id]
  }

  ingress {
    description = "SSH port for connection"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc_system_challenge_1.cidr_block, "0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.vpc_system_challenge_1.cidr_block, "0.0.0.0/0"]
  }

  tags = {
    Name = "SG for Backend Application"
    Project = var.project_name
  }
}