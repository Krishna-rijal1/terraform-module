resource "aws_vpc" "testvpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.testvpc.id
    cidr_block = var.cidr_public
    availability_zone = "us-east-1a"
  
}
resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.testvpc.id
    cidr_block = var.cidr_private
    availability_zone = "us-east-1b"
  
}
resource "aws_internet_gateway" "my_internet_gwy" {
    vpc_id = aws_vpc.testvpc.id
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.testvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_internet_gwy.id
  }
}
//subnet association
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id

}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.testvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_internet_gwy.id
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id

}

resource "aws_security_group" "my_security_group" {
  vpc_id      = aws_vpc.testvpc.id
//Inbound rule for SSH (for instance in the private subnet)
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  //Inbound rule for HTTP traffic (for instance in the public subnet)
  ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 443
        to_port = 443
        protocol = "tcp"
    }
    ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  }