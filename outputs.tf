output "vpc_id" {
  value = aws_vpc.main.id
}

output "dev_subnet_id" {
  value = aws_subnet.dev.id
}

output "staging_subnet_id" {
  value = aws_subnet.staging.id
}

output "prod_subnet_id" {
  value = aws_subnet.prod.id
}