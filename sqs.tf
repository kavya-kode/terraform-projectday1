resource "aws_sqs_queue" "events" {
  name = "placemux-events"

  tags = {
    Name = "placemux-events"
  }
}