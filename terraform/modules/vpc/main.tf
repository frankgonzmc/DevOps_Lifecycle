resource "aws_vpc" "vpc" {
    cidr_block = var.network_vpc
    tags = {
        Name = "main_vpc"
    }
}


resource "aws_subnet" "subnet_public" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.network_subnet_public
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true # Automatically assign public IPs to instances in this subnet
    tags = {
        Name = "subnet_public"
    }
}

resource "aws_internet_gateway" "my_gateway"{
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "my_internet_gateway"
    }
}


resource "aws_route_table" "table_route_subnet_public"{
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0" # Route all traffic to the internet
        gateway_id = aws_internet_gateway.my_gateway.id
    }
    tags = {
        Name = "route_table_public"
    }
}

resource "aws_route_table_association" "route_table_association_subnet_public"{
    subnet_id = aws_subnet.subnet_public.id
    route_table_id = aws_route_table.table_route_subnet_public.id
}


resource "aws_subnet" "subnet_private"{
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.network_subnet_private
    availability_zone = var.availability_zone
    map_public_ip_on_launch = false # Do not assign public IPs to instances in this subnet
    tags = {
        Name = "subnet_private"
    }
}