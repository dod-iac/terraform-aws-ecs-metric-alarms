/**
 * # terraform-aws-ecs-metric-alarms
 *
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

  alarm_name        = format("%s-cpu", var.name)
  alarm_description = format("CPU Threshold for %s", var.name)

  actions_enabled           = var.actions_enabled
  alarm_actions             = var.actions_alarm
  ok_actions                = var.actions_ok
  insufficient_data_actions = var.actions_insufficient_data

  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtiliziation"
  namespace           = "AWS/ECS"
  period              = "300"
  statistic           = "Average"
  threshold           = var.threshold_cpu
  treat_missing_data  = "notBreaching"

  dimensions = {
    ClusterName = var.ecs_cluster_name
    ServiceName = var.ecs_service_name
  }

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "mem" {

  alarm_name        = format("%s-mem", var.name)
  alarm_description = format("Memory Threshold for %s", var.name)

  actions_enabled           = var.actions_enabled
  alarm_actions             = var.actions_alarm
  ok_actions                = var.actions_ok
  insufficient_data_actions = var.actions_insufficient_data

  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "MemoryUtiliziation"
  namespace           = "AWS/ECS"
  period              = "300"
  statistic           = "Average"
  threshold           = var.threshold_mem
  treat_missing_data  = "notBreaching"

  dimensions = {
    ClusterName = var.ecs_cluster_name
    ServiceName = var.ecs_service_name
  }

  tags = var.tags
}
