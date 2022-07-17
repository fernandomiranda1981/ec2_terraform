resource "aws_db_instance" "db" {
  identifier  = var.identifier
  allocated_storage    = 10
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name                 = var.name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true

  tags = {
    Name = "terraform_rds"
  }
}