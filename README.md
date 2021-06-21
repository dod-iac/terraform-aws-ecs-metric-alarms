<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# terraform-aws-ecs-metric-alarms

## Usage

Creates metric alarms for use with a ECS Service

* CPU Threshold
* Memory Threshold

```hcl
module "ecs_metric_alarms" {
  source = "dod-iac/ecs-metric-alarms/aws"

  name           = var.application

  actions_alarm             = [var.sns_topic_arn]
  actions_ok                = [var.sns_topic_arn]
  actions_insufficient_data = [var.sns_topic_arn]

  tags = {
    Application = var.application
    Environment = var.environment
    Automation  = "Terraform"
  }
}
```

## Terraform Version

Terraform 0.13. Pin module version to ~> 1.0.0 . Submit pull-requests to master branch.

Terraform 0.11 and 0.12 are not supported.

## License

This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.  However, because the project utilizes code licensed from contributors and other third parties, it therefore is licensed under the MIT License.  See LICENSE file for more information.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.mem](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_actions_alarm"></a> [actions\_alarm](#input\_actions\_alarm) | List of alarm actions to take | `list(string)` | `[]` | no |
| <a name="input_actions_enabled"></a> [actions\_enabled](#input\_actions\_enabled) | Enable the actions. Set to false to temporarily disable actions. | `bool` | `true` | no |
| <a name="input_actions_insufficient_data"></a> [actions\_insufficient\_data](#input\_actions\_insufficient\_data) | List of insufficient data actions to take | `list(string)` | `[]` | no |
| <a name="input_actions_ok"></a> [actions\_ok](#input\_actions\_ok) | List of ok actions to take | `list(string)` | `[]` | no |
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | The ECS Cluster name for use with CloudWatch Metrics. | `string` | n/a | yes |
| <a name="input_ecs_service_name"></a> [ecs\_service\_name](#input\_ecs\_service\_name) | The ECS Service name for use with CloudWatch Metrics. | `string` | n/a | yes |
| <a name="input_enable_metric_alarm"></a> [enable\_metric\_alarm](#input\_enable\_metric\_alarm) | Enable the metric alarm | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The service name. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to the metric alarms. | `map(string)` | `{}` | no |
| <a name="input_threshold_cpu"></a> [threshold\_cpu](#input\_threshold\_cpu) | The threshold for the cpu metric alarm | `string` | `"80.0"` | no |
| <a name="input_threshold_mem"></a> [threshold\_mem](#input\_threshold\_mem) | The threshold for the mem metric alarm | `string` | `"80.0"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cpu_metric_alarm_arn"></a> [cpu\_metric\_alarm\_arn](#output\_cpu\_metric\_alarm\_arn) | The ARN of the cpu metric alarm |
| <a name="output_cpu_metric_alarm_id"></a> [cpu\_metric\_alarm\_id](#output\_cpu\_metric\_alarm\_id) | The ID of the cpu metric alarm |
| <a name="output_mem_metric_alarm_arn"></a> [mem\_metric\_alarm\_arn](#output\_mem\_metric\_alarm\_arn) | The ARN of the mem metric alarm |
| <a name="output_mem_metric_alarm_id"></a> [mem\_metric\_alarm\_id](#output\_mem\_metric\_alarm\_id) | The ID of the mem metric alarm |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
