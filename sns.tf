resource "aws_sns_topic" "alerts" {
  name = "placemux-alerts"
}
resource "aws_sns_topic_subscription" "email_alerts" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "kavyak4719@gmail.com"
}