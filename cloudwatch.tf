resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/placemux"
  retention_in_days = 7
}