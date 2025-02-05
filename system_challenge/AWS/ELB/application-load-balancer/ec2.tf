resource "aws_instance" "ec2_instance_web_alb_module" {
  ami           = var.ami_amazon_linux_id
  instance_type = var.instance_type

  depends_on = [
    aws_security_group.sg_web_alb_module
  ]

  tags = {
    Name    = var.name
    Project = var.project_name
  }

  availability_zone      = var.deloy_az1
  subnet_id              = aws_subnet.public_subnet_alb_module_az1.id
  vpc_security_group_ids = [aws_security_group.sg_web_alb_module.id]

  user_data_replace_on_change = true
  user_data                   = file("./script/template.sh")
}