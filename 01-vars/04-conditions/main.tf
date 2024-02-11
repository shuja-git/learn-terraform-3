resource "aws_instance" "ec2-instance" {
  ami = "ami-0f3c7d07486cad139"
  instance_type =  var.instance_type == "" ? "t2.micro" : var.instance_type
  vpc_security_group_ids = ["sg-08f41a3b66746e56a"]
}
variable "instance_type" {}
