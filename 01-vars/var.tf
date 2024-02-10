variable "sample1" {
  default = "Hello from sample1"
}
variable "sample_list" {
  default = [
    "Shuja",
    "Luqman",
    100,
    true
  ]
}
variable "list_of_map" {
  default = [
    {
      course_name = "aws"
      trainer_name = "Shuja"
    },
    {
      course_name = "devops"
      trainer_name = "Luqman"
    }
  ]
}