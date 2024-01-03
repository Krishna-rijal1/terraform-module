output "vpc_id" {
    value = aws_vpc.testvpc.id
  
}
output "public_subnet" {
    value = aws_subnet.public_subnet.id
  
}
output "private_subnet" {
    value = aws_subnet.private_subnet.id
  
}
output "public_cidr" {
    value = var.cidr_public
  
}
output "private_cidr" {
    value = var.cidr_private
  
}
output "my_security_group" {
  value = aws_security_group.my_security_group.id  
}