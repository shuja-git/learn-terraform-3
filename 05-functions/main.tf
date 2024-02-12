variable "private_ip" {
  default = {
    cart      = {
       private_ip = "1.1.1.1"
  }
   catalogue = {
 private_ip = "2.2.2.2"
}

}
}

output "test" {
  value = var.private_ip
}