variable "name" {
  default = "ALB-module IaC"
  type    = string
}

variable "project_name" {
  default = "Application Load Balancer module project"
  type    = string
}

variable "deploy_region" {
  default = "ap-southeast-1"
  type    = string
}

variable "deloy_az1" {
  default = "ap-southeast-1a"
  type    = string
}

variable "deloy_az2" {
  default = "ap-southeast-1b"
  type    = string
}

variable "instance_type" {
  default = "t2.micro"
  type    = string
}

variable "ami_amazon_linux_id" {
  description = "This is the AMI ID for the Amazon Linux"
  default     = "ami-08908d9e195550170"
  type        = string
}

variable "ami_ubuntu_linux_id" {
  description = "This is the AMI ID for the Ubuntu Linux"
  default     = "ami-04b4f1a9cf54c11d0"
  type        = string
}
