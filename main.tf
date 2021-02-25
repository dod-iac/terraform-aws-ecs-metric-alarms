/**
 * ## Usage
 *
 * Creates metric alarms for use with a ECS Service
 *
 * * CPU Threshold
 * * Memory Threshold
 *
 * ```hcl
 * module "ecs_metric_alarms" {
 *   source = "dod-iac/ecs-metric-alarms/aws"
 *
 *   name           = var.application
 *   environment    = var.environment
 *
 *   actions_alarm             = [var.sns_topic_arn]
 *   actions_ok                = [var.sns_topic_arn]
 *   actions_insufficient_data = [var.sns_topic_arn]
 *
 *   tags = {
 *     Application = var.application
 *     Environment = var.environment
 *     Automation  = "Terraform"
 *   }
 * }
 * ```
 *
 * ## Terraform Version
 *
 * Terraform 0.13. Pin module version to ~> 1.0.0 . Submit pull-requests to master branch.
 *
 * Terraform 0.11 and 0.12 are not supported.
 *
 * ## License
 *
 * This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.  However, because the project utilizes code licensed from contributors and other third parties, it therefore is licensed under the MIT License.  See LICENSE file for more information.
 */

resource "aws_cloudwatch_metric_alarm" "cpu" {

  alarm_name        = format("%s-%s-cpu", var.name, var.environment)
  alarm_description = format("CPU Threshold for %s %s", var.name, var.environment)

  actions_enabled           = var.actions_enabled
  alarm_actions             = var.actions_alarm
  ok_actions                = var.actions_ok
  insufficient_data_actions = var.actions_insufficient_data

  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metricName          = "CPUUtiliziation"
  namespace           = "AWS/ECS"
  period              = "300"
  statistic           = "Average"
  threshold           = var.threshold
  treat_missing_data  = "notBreaching"

  dimensions = {
    ServiceName = var.ecs_service_name
  }

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "mem" {

  alarm_name        = format("%s-%s-mem", var.name, var.environment)
  alarm_description = format("Memory Threshold for %s %s", var.name, var.environment)

  actions_enabled           = var.actions_enabled
  alarm_actions             = var.actions_alarm
  ok_actions                = var.actions_ok
  insufficient_data_actions = var.actions_insufficient_data

  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metricName          = "MEMUtiliziation"
  namespace           = "AWS/ECS"
  period              = "300"
  statistic           = "Average"
  threshold           = var.threshold
  treat_missing_data  = "notBreaching"

  dimensions = {
    ServiceName = var.ecs_service_name
  }

  tags = var.tags
}
