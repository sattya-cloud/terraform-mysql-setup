output "db_instance_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.mysql.address
}

output "db_instance_port" {
  description = "The port of the RDS instance"
  value       = aws_db_instance.mysql.port
}
