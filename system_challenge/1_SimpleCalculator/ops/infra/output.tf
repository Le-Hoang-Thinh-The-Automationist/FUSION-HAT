output "be_application_private_ip" {
  value = aws_instance.be_application_instance.private_ip
}

output "fe_web_private_ip" {
  value = aws_instance.fe_web_instance.private_ip
}

output "fe_web_public_ip" {
  value = aws_instance.fe_web_instance.public_ip
}