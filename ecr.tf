resource "aws_ecr_repository" "backend" {
  name = "placemux-backend"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "placemux-backend"
    Environment = "dev"
  }
}