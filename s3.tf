resource "aws_s3_bucket" "artifacts" {
  bucket = "placemux-artifacts-215302750371"

  tags = {
    Name = "placemux-artifacts"
  }
}