module "vpc" {
    source = "./modules/vpc"
    network_vpc          = var.network_vpc
    network_subnet_public = var.network_subnet_public
    network_subnet_private = var.network_subnet_private
}

module "sg_ec2" {
  source = "./modules/security_group_ec2"
  vpc_id = module.vpc.vpc_id
  my_ip  = var.my_ip
}

module "sg_rds" {
  source      = "./modules/security_group_rds"
  vpc_id      = module.vpc.vpc_id
  ec2_sg_id   = module.sg_ec2.security_group_id
}