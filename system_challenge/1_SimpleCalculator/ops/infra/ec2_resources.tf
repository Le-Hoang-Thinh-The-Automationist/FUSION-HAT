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
  user_data                   = file("./script/be_app_script.sh")
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
  user_data                   = file("./script/fe_web_script.sh")
}