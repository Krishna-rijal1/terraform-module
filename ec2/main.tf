#creating instnance 
resource "aws_instance" "krishna" {
    ami = "ami-0c7217cdde317cfec"
    instance_type ="t2.micro"
    subnet_id = var.subnet_id1
    associate_public_ip_address = true
    vpc_security_group_ids = [var.security_group]
    key_name = "krishna"
    volume_tags = local.tags
}


# resource "aws_instance" "krishna1" {
#     ami = "ami-0c7217cdde317cfec"
#     instance_type ="t2.micro"
#     subnet_id = var.subnet_id2
#     vpc_security_group_ids = [var.security_group]
#     key_name = "krishna"
#        volume_tags = local.tags
# }

