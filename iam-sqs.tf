
# SQS policy and attachment 

data "aws_iam_policy_document" "sqs" {

  statement {
    effect = "Allow"

    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
    ]

    resources = [
      aws_sqs_queue.sqs.arn,
    ]
  }
}

resource "aws_iam_policy" "sqs" {

  name   = "${var.function_name}-sqs"
  policy = data.aws_iam_policy_document.sqs.json
}

resource "aws_iam_policy_attachment" "sqs" {

  name   = var.function_name
  roles  = [aws_iam_role.lambda.name]
  policy_arn = aws_iam_policy.sqs.arn
}
