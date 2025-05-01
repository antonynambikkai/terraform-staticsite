resource "aws_instance" "vm" {
  ami           = "ami-00304a369b0f2a09c"
  instance_type = "t2.medium"
  user_data     = data.template_file.user_data.rendered
  tags = {
    Name = "${var.project}-vm"
  }
}


data "template_file" "user_data" {
  template = file("${path.module}/userdata.sh")
}

module "network" {
  source = "./modules/network"
}

module "alb" {
  source  = "./modules/alb"
  vpc_id  = module.network.vpc_id
  subnets = module.network.public_subnets
}

module "s3" {
  source = "./modules/s3"
}


module "s3_vpc_endpoint" {
  source = "./modules/s3_vpc_endpoint"
  vpc_id = module.network.vpc_id
  route_table_ids = module.network.route_table_ids
}

