module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source         = "./ec2"
  vpc_id         = module.vpc.vpc_id
  subnet_id1     = module.vpc.public_subnet
  subnet_id2     = module.vpc.private_subnet
  security_group = module.vpc.my_security_group
}

module "rds" {
  source = "./rds"
  vpc_id = module.vpc.vpc_id
  private_subnet = module.vpc.private_subnet
  public_subnet = module.vpc.public_subnet
  username = "krish"
  password = "krish123"
  security_group = module.vpc.my_security_group
  
}

 

