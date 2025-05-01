
variable "vpc_id" {}
variable "route_table_ids" {  type    = string}
variable "region" {
  type    = string
  default = "us-east-2"
}
