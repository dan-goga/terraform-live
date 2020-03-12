output "neo_arn" {
  description = "The ARN for user neo"
  value       = aws_iam_user.example[0].arn
}

output "all_arns" {
  description = "Display all arns created with example aws_iam_user resource"
  value       = aws_iam_user.example[*].arn
}

