resource "aws_instance" "be_application_instance" {
  ami           = var.ami_amazon_linux_id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.private_be_application_sg.id]
  subnet_id = aws_subnet.private.id
  availability_zone      = var.deloy_az

  tags = {
    Name    = "Backend Application"
    Project = var.project_name
  }

  user_data_replace_on_change = true
  user_data                   = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo systemctl enable httpd
                echo "<h1>Hello from Backend Application at $(hostname -f)</h1>" > /var/www/html/index.html
                EOF
}

resource "aws_instance" "fe_web_instance" {
  ami           = var.ami_amazon_linux_id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.public_fe_web_sg.id]
  subnet_id = aws_subnet.public.id
  availability_zone      = var.deloy_az

  tags = {
    Name    = "Frontend Web"
    Project = var.project_name
  }

  user_data_replace_on_change = true
  user_data                   = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo systemctl enable httpd
                echo "<h1>Hello from Frontend Web at $(hostname -f)</h1>" > /var/www/html/index.html
                EOF
}