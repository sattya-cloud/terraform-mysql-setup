# Provider configuration
provider "aws" {
  region = var.region
}

# Security group for RDS allowing access
resource "aws_security_group" "rds_sg" {
  name        = "rds_security_group"
  description = "Allow MySQL access"
  vpc_id      = var.vpc_id # Ensure you provide the correct VPC ID here

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict this for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# RDS MySQL Instance
resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  publicly_accessible  = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot  = true
}

# Local provisioner to run SQL scripts
resource "null_resource" "run_schema" {
  depends_on = [aws_db_instance.mysql]

  provisioner "local-exec" {
    command = "mysql -h ${aws_db_instance.mysql.address} -P 3306 -u ${aws_db_instance.mysql.username} -p${aws_db_instance.mysql.password} < ${path.module}/schema.sql"
  }
}
