variable "instances" {
  default = {
    cart = {
      name = "cart"
      type = "t2.micro"
    }
    catalogue = {
      name = "catalogue"
      type = "t2.micro"
    }
  }
}
