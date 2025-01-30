variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "db_username" {
  description = "Database username"
  default     = "admin" # Replace with your username
}

variable "db_password" {
  description = "Database password"
  default     = "securepassword123" # Replace with your secure password
}

variable "vpc_id" {
  description = "The ID of the VPC where resources will be created"
}
