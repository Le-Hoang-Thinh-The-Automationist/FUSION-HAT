resource "aws_vpc" "vpc_system_challenge_1" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = "VPC"
    Project = var.project_name
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc_system_challenge_1.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.deloy_az
  map_public_ip_on_launch = true
  tags = {
    Name    = "Public Web Subnet"
    Project = var.project_name
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.vpc_system_challenge_1.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.deloy_az
  tags = {
    Name    = "Private Web Subnet"
    Project = var.project_name
  }
}

resource "aws_route_table_association" "public_route_assoc" {
  route_table_id = aws_route_table.rtb_system_challenge_1.id
  subnet_id      = aws_subnet.public.id
}

resource "aws_route_table" "rtb_system_challenge_1" {
  vpc_id = aws_vpc.vpc_system_challenge_1.id

  tags = {
    Name    = "RTB"
    Project = var.project_name
  }
}

# Private Route table
resource "aws_route_table" "private_rtb_system_challenge_1" {
  vpc_id = aws_vpc.vpc_system_challenge_1.id

  route {
    cidr_block = aws_vpc.vpc_system_challenge_1.cidr_block
    gateway_id = "local"
  }

  tags = {
    Name    = "RTB"
    Project = var.project_name
  }
}

resource "aws_route" "public_route_to_igw" {
  route_table_id = aws_route_table.rtb_system_challenge_1.id
  gateway_id     = aws_internet_gateway.igw_system_challenge_1.id

  destination_cidr_block = "0.0.0.0/0"

}

resource "aws_internet_gateway" "igw_system_challenge_1" {
  vpc_id = aws_vpc.vpc_system_challenge_1.id

  tags = {
    Name    = "IGW"
    Project = var.project_name
  }
}