module "vpc" {
  source                 = "./modules/vpc"
  network_vpc            = var.network_vpc
  network_subnet_public  = var.network_subnet_public
  network_subnet_private = var.network_subnet_private
}

module "sg_ec2" {
  source = "./modules/security_group_ec2"
  vpc_id = module.vpc.vpc_id
  my_ip  = var.my_ip
}

module "sg_rds" {
  source    = "./modules/security_group_rds"
  vpc_id    = module.vpc.vpc_id
  ec2_sg_id = module.sg_ec2.security_group_id
}

module "key_pair" {
  source          = "./modules/key_pair"
  key_name        = "django-key"
  public_key_path = "${path.module}/keys/id_rsa.pub"
}

module "ec2_instance" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  subnet_id         = module.vpc.subnet_public_id
  security_group_id = module.sg_ec2.security_group_id
  instance_type     = var.instance_type
  key_name          = module.key_pair.key_name
}

module "rds" {
  source = "./modules/rds"

  private_subnet_ids    = module.vpc.private_subnet_ids
  rds_security_group_id = module.sg_rds.security_group_id

  db_identifier = "my-rds-db"
  db_username   = var.db_username
  db_password   = var.db_password
}