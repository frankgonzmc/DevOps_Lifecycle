module "vpc" {
    source = "./modules/vpc"
    network_vpc          = var.network_vpc
    network_subnet_public = var.network_subnet_public
    network_subnet_private = var.network_subnet_private
}