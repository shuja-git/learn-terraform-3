variable "test" {
  default = {
    cart      = {
       private_ip = "1.1.1.1"
  }
   catalogue = {
 private_ip = "2.2.2.2"
}

}
}

output "private_ip" {
  value =  lookup(var.test["private_ip"], "cart")

}