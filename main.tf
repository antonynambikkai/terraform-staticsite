resource "aws_instance" "vm" {  
  ami           = "ami-00304a369b0f2a09c"
  instance_type = "t2.medium"
  user_data = data.template_file.user_data.rendered
  tags = {
    Name = "${var.project}-vm"
  }
}


data "template_file" "user_data" {
   template = file("${path.module}/userdata.sh")
 }

