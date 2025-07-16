variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type = string
}

variable "instance_type" {
    description = "Instance type"
    type = string 
}

variable "subnet_id" {
    description = "subnet ID"
    type = string
}

variable "security_group_id"{
    description = "sg ID EC2"
    type = string
}

variable "key_name" {
    description = "Nombre de key pair"
    type = string
}