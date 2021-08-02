output "sns_arn" {
  value = "${aws_sns_topic.results_updates.arn}"
}

output "sqs_arn" {
  value = "${aws_sqs_queue.results_updates_queue.arn}"
}
