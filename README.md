# terraform-mysql-setup

Here's a README.md description for your Terraform MySQL DB Automation project:

Terraform MySQL DB Automation
Overview
This project automates the creation of a MySQL Database using Terraform. It also ensures that the required schema (database, tables, and initial data) is created using Terraform’s local-exec provisioner.

Features
Creates a MySQL Database on AWS RDS or a local instance.
Uses Terraform local-exec provisioner to execute SQL scripts for schema creation.
Automates table creation and data insertion.
Ensures Infrastructure as Code (IaC) compliance.
Technologies Used
Terraform
MySQL
AWS RDS (if deploying on AWS)
Local-Exec Provisioner
Prerequisites
Terraform installed on your system
MySQL server running (local or AWS RDS)
SQL script (schema.sql) for database setup
