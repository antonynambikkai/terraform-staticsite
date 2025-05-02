
# modules/s3_vpc_endpoint/main.tf
resource "aws_vpc_endpoint" "s3" {
vpc_id = var.vpc_id
service_name = "com.amazonaws.${var.region}.s3"
vpc_endpoint_type = "Interface"
private_dns_enabled = true
}
