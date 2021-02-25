
output "cpu_metric_alarm_id" {
  description = "The ID of the cpu metric alarm"
  value       = aws_cloudwatch_metric_alarm.cpu.id
}

output "cpu_metric_alarm_arn" {
  description = "The ARN of the cpu metric alarm"
  value       = aws_cloudwatch_metric_alarm.cpu.arn
}

output "mem_metric_alarm_id" {
  description = "The ID of the mem metric alarm"
  value       = aws_cloudwatch_metric_alarm.mem.id
}

output "mem_metric_alarm_arn" {
  description = "The ARN of the mem metric alarm"
  value       = aws_cloudwatch_metric_alarm.mem.arn
}
