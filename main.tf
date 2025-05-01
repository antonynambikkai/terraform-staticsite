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

module "vpc" {
source = "./modules/network"
vpc_cidr = var.vpc_cidr
public_subnet_cidrs = var.public_subnet_cidrs
}


module "s3" {
  source = "./modules/s3"
}

#module "alb" {

#source = "./modules/alb"
#vpc_id = module.vpc.vpc_id
#subnets = module.vpc.public_subnets

#}

 module "s3_vpc_endpoint" {
   source          = "./modules/s3_vpc_endpoint"
   vpc_id = module.vpc.vpc_id
   route_table_ids = module.vpc.route_table_ids

   
    } 

