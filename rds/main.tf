resource "aws_db_instance" "krishna_db" {
  allocated_storage    = 10
  db_name              = "krishna"
  engine               = "mysql"
  engine_version       = "8.0.35"
  multi_az             = false
  instance_class       = "db.t3.micro"
  username             = var.username
   delete_automated_backups = true
  password             = var.password
  # parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
   vpc_security_group_ids = [var.security_group]
   db_subnet_group_name =aws_db_subnet_group.db_subnetgroup.id

}




resource "aws_db_subnet_group" "db_subnetgroup" {
  subnet_ids = [var.private_subnet, var.public_subnet]
  
}


