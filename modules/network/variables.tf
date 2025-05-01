variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
  
}

variable "region" {
  type    = string
  default = "us-east-2"
}


variable "public_subnet_cidrs" {
type = list(string)
}

