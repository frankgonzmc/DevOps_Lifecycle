#For VPC
network_vpc = "10.0.0.0/16"
network_subnet_public = "10.0.1.0/24"
network_subnet_private  = "10.0.2.0/24"
my_ip = "0.0.0.0/0" # Just for testing, replace with your actual IP address with /32 

#EC2
ami_id         = "ami-xxxxxxxxxxxx" # Ubuntu 22.04 LTS
instance_type  = "t3.micro"

#RDS
db_username = "mydbuser"
db_password = "strong_password_123"