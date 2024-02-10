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
resource "null_resource" "nothing" {
  for_each = var.d3
}