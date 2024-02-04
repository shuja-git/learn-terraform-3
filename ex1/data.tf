data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

data "aws_vpc" "default-vpc-id" {
  id = var.vpc_id
}

data "aws_route53_zone" "My-Zone" {
  name         = "shujadevops.online"
}

