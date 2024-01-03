variable "vpc_id" {
    default = " "
  
}

variable "subnet_id1" {
    description = "for public subnet"
    default = ""
  
}
variable "subnet_id2" {
    description = "for private subnet"
    default = ""
  
}
variable "security_group" {
    default = ""
  
}