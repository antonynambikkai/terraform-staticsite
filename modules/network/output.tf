output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnets" {
  value = aws_subnet.public[*].ID
}

output "aws_default_route_table" {
  value = aws_default_route_table.rtb.id
}