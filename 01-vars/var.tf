#variable "sample1" {
#  default = "Hello from sample1"
#}
#variable "sample_list" {
#  default = [
#    "Shuja",
#    "Luqman",
#    100,
#    true
#  ]
#}
#variable "list_of_map" {
#  default = [
#    {
#      course_name = "aws"
#      trainer_name = "Shuja"
#    },
#    {
#      course_name = "devops"
#      trainer_name = "Luqman"
#    }
#  ]
#}
variable "d3" {
  default = {
    apple = {
      name = "apple"
      count = 2
    }
    banana ={
      name = "banana"
      count = 5
    }
  }
}
#resource "null_resource" "nothing" {
#  for_each = var.d3
#}
#variable "names" {
#  default = ["cart","user"]
#}
#variable "types" {
#  default = ["t2.micro","t3.micro"]
#}
#
#resource "aws_instance" "cart" {
#  count         = length(length(var.names))
#  ami           = "ami-0f3c7d07486cad139"
#  instance_type = var.types[count.index]
#  vpc_security_group_ids = ["sg-08f41a3b66746e56a"]
#  tags = {
#    Name = var.names[count.index]
#  }
#}

# Little mature code where we use list of maps
#variable "little_mature" {
#  default = [
#  {
#      name = "catalogue"
#      type = "t2.micro"
#    },
#     {
#      name = "cart"
#      type = "t3.micro"
#    }
#  ]
#}
variable "instances" {
  default = {
    shipping = {
      name = "catalogue"
      type = "t2.micro"
    }
    payment = {
      name = "payment"
      type = "t3.micro"
    }
  }
}
resource "aws_instance" "instance" {
  for_each =    var.instances
  ami           = "ami-0f3c7d07486cad139"
  instance_type = each.value["type"]
  vpc_security_group_ids = ["sg-08f41a3b66746e56a"]
  tags = {
    Name = each.value["name"]
  }
}




