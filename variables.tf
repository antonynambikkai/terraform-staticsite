variable "project" {
  description = "The AWS Project Name."
  type        = string
}
variable "region" {
  type    = string
  default = "us-east-2"
}


variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.6.0/24", "10.0.2.0/24"]
}

variable "alb_name" {
  default = "static-alb"
}

variable "alb_security_group_ingress" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [{
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

variable "bucket_name" {
  default = "example-bucket"
}

variable "bucket_acl" {
  default = "private"
}