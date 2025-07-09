variable "network_vpc" {
    description = "value of the VPC CIDR block"
    type        = string
}

variable "network_subnet_public" {
    description = "value of the public subnet CIDR block"
    type        = string
}

variable "availability_zone" {
    description = "Availability zone for the public subnet"
    type        = string
    default     = "us-east-1a"
}

variable "network_subnet_private" {
    description = "value of the private subnet CIDR block"
    type        = string
}