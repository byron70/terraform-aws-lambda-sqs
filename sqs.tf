resource "aws_sqs_queue" "sqs" {
  
  name        = var.function_name
  tags = var.tags

}
