
resource "aws_vpc" "this" {
cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public" {
count = length(var.public_subnet_cidrs)
vpc_id = aws_vpc.this.id
cidr_block = element(var.public_subnet_cidrs, count.index)
map_public_ip_on_launch = true
}

resource "aws_route_table" "public" {
vpc_id = aws_vpc.this.id
}


