variable "vpc_id" {}
variable "subnets" {}

variable "alb_name" {

    type = string
    default = "Capstone_Project"
  
}


variable "alb_security_group_ingress" {
type = list(object({
from_port = number
to_port = number
protocol = string
cidr_blocks = list(string)
}))
}
