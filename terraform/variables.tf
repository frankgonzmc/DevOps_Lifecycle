###VPC###
variable "network_vpc" {
  description = "value of the VPC CIDR block"
  type        = string
}

variable "network_subnet_public" {
  description = "value of the public subnet CIDR block"
  type        = string
}

variable "network_subnet_private" {
  description = "value of the private subnet CIDR block"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "my_ip" {
  description = "Your IP address"
  type        = string
}

#EC2
variable "ami_id" {
  description = "ami ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

#RDS
variable "db_username" {
  description = "value"
  type        = string
}

variable "db_password" {
  description = "value"
  type        = string
}