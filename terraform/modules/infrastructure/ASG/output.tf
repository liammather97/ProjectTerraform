output "launch" {
  value = aws_launch_configuration.main.id
  description =  "launch id"
}

output "ASG" {
  value = aws_autoscaling_group.main.id
  description = "ASG id"
}

