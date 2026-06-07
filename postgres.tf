resource "aws_db_subnet_group" "postgres" {
  name = "placemux-postgres-subnet-group"

  subnet_ids = [
    aws_subnet.dev.id,
    aws_subnet.staging.id,
    aws_subnet.prod.id
  ]

  tags = {
    Name = "placemux-postgres-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier = "placemux-dev-postgres"

  engine         = "postgres"
  engine_version = "16"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  storage_type = "gp2"

  db_name  = "placemux"
  username = "postgres"
  password = "Placemux123!"

  publicly_accessible = true

  skip_final_snapshot = true

  db_subnet_group_name = aws_db_subnet_group.postgres.name
}