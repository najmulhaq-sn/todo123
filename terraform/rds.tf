resource "aws_db_instance" "content_db" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "13.6"
  instance_class       = "db.t2.micro"
  db_name              = "najmul"
  username             = "najmul"
  password             = "najmul"
  parameter_group_name = "default.postgres13"
  skip_final_snapshot  = true

  #multi_az = true

  storage_encrypted = true

  #security_group_names = aws_security_group.rds_security_groups.name
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  publicly_accessible = false
  depends_on = [
    aws_db_subnet_group.subnet_db_group
  ]
}