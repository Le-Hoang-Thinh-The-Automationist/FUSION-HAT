variable "project_name" {
  default = "Simple Calculator"
  type    = string
}

variable "deploy_region" {
  default = "ap-southeast-1"
  type    = string
}

variable "deloy_az" {
  default = "ap-southeast-1a"
  type    = string
}

variable "instance_type" {
  default = "t2.micro"
  type    = string
}

variable "ami_amazon_linux_id" {
  description = "This is the AMI ID for the Amazon Linux"
  default     = "ami-0bd55ebedabddc3c0"
  type        = string
}

variable "ami_ubuntu_linux_id" {
  description = "This is the AMI ID for the Ubuntu Linux"
  default     = "ami-04b4f1a9cf54c11d0"
  type        = string
}

variable "fe_port" {
  default = 80
  type    = number
}

variable "be_port" {
  default = 8080
  type    = number
}