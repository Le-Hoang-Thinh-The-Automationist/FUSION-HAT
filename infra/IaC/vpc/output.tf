output "route_table_id" {
  value = aws_route_table.dev_route_table.id
}

output "subnet_id_id" {
  value = aws_subnet.dev_public_subnet.id
}

output "internet_gateway_id" {
    value = aws_internet_gateway.dev_internet_gateway.id
}

output "vpc_id" {
    value = aws_vpc.dev_vpc.id
}