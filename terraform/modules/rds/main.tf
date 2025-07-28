resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "RDS subnet group"
  }
}

resource "aws_db_instance" "rds_instance" {
  identifier             = var.db_identifier
  engine                 = var.db_engine         #Motor db
  engine_version         = var.db_engine_version #Version db
  instance_class         = var.instance_class    # Instance type
  allocated_storage      = var.allocated_storage # Min 20 Gb, 
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [var.rds_security_group_id]
  skip_final_snapshot    = true  # If it's true when it will be destroyed it doens't save a backup, False for production 
  publicly_accessible    = false # It doesn't have a public IP, only in subnet
  multi_az               = false # If it's true it is in other AZ
  storage_encrypted      = true  # Data encrypted
}