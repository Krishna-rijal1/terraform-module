variable "username" {
 type = string
 sensitive = true

}
variable "password" {
type = string
sensitive = true

}

variable "security_group" {
    default = ""
  
}
variable "vpc_id" {
  type = string
  default = ""
  
}

variable "private_subnet" {
  type = string
  default = ""
  
}

variable "public_subnet" {
  type = string
  default = ""
  
}
