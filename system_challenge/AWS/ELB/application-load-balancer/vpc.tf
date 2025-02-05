resource "aws_vpc" "vpc_alb_module" {
  cidr_block = "10.0.0.0/16"

  # Allow instance to resolve the DNS names of other instances
  # Resolve = translate the human-readable domain names to IP address
  enable_dns_support = true

  # Allow instance to have a public dns name beside the private dns
  # enable_dns_support must be 'true' before using this
  enable_dns_hostnames = true

  tags = {
    Project = var.project_name
    Name    = var.name
  }
}

resource "aws_subnet" "public_subnet_alb_module_az1" {
  vpc_id     = aws_vpc.vpc_alb_module.id
  cidr_block = "10.0.1.0/24"

  availability_zone       = var.deloy_az1
  map_public_ip_on_launch = true


  # Wait until the Route table is created to create the subnet so 
  # that it would not accidentially create dummy rtb
  depends_on = [aws_route_table.public_rtb_alb_module]

  tags = {
    Project = var.project_name
    Name    = var.name
  }
}

resource "aws_subnet" "public_subnet_alb_module_az2" {
  vpc_id     = aws_vpc.vpc_alb_module.id
  cidr_block = "10.0.2.0/24"

  availability_zone       = var.deloy_az2
  map_public_ip_on_launch = true


  # Wait until the Route table is created to create the subnet so 
  # that it would not accidentially create dummy rtb
  depends_on = [aws_route_table.public_rtb_alb_module]

  tags = {
    Project = var.project_name
    Name    = var.name
  }
}

resource "aws_internet_gateway" "public_igw_alb_module" {
  vpc_id = aws_vpc.vpc_alb_module.id
}

resource "aws_route_table" "public_rtb_alb_module" {
  vpc_id = aws_vpc.vpc_alb_module.id

  tags = {
    Project = var.project_name
    Name    = var.name
  }
}


resource "aws_route" "public_route_alb_module" {
  route_table_id = aws_route_table.public_rtb_alb_module.id
  gateway_id     = aws_internet_gateway.public_igw_alb_module.id

  destination_cidr_block = "0.0.0.0/0"

  # Wait for the following resources to created before create this resource
  depends_on = [
    aws_route_table.public_rtb_alb_module,
    aws_internet_gateway.public_igw_alb_module
  ]

}

resource "aws_route_table_association" "public_rtb_associate_alb_module" {
  route_table_id = aws_route_table.public_rtb_alb_module.id
  subnet_id      = aws_subnet.public_subnet_alb_module_az1.id

  depends_on = [
    aws_route_table.public_rtb_alb_module,
    aws_subnet.public_subnet_alb_module_az1
  ]

}