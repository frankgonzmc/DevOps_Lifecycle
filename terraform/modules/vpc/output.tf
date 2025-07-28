output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_public_id" {
  value = aws_subnet.subnet_public.id
}

output "private_subnet_ids" {
  value = aws_subnet.subnet_private[*].id
}