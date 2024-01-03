variable "vpc_cidr" {
    description = "cidr of vpc"
    default = "10.10.0.0/16"
  
}
variable "cidr_public" {
    description = "cidr range of subnet"
    default = "10.10.1.0/24"
  
}
variable "cidr_private" {
    default = "10.10.2.0/24"
   
  
}
