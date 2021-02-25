<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Usage

Creates metric alarms for use with a ECS Service

* CPU Threshold
* Memory Threshold

```hcl
module "ecs_metric_alarms" {
  source = "dod-iac/ecs-metric-alarms/aws"

  name           = var.application
  environment    = var.environment

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
| terraform | ~> 0.13.0 |
| aws | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_cloudwatch_metric_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| actions\_alarm | List of alarm actions to take | `list(string)` | `[]` | no |
| actions\_enabled | Enable the actions. Set to false to temporarily disable actions. | `bool` | `true` | no |
| actions\_insufficient\_data | List of insufficient data actions to take | `list(string)` | `[]` | no |
| actions\_ok | List of ok actions to take | `list(string)` | `[]` | no |
| ecs\_service\_name | The ECS Service name for use with CloudWatch Metrics. | `string` | n/a | yes |
| enable\_metric\_alarm | Enable the metric alarm | `bool` | `true` | no |
| environment | Environment tag, e.g prod. | `string` | n/a | yes |
| name | The service name. | `string` | n/a | yes |
| tags | Tags applied to the metric alarms. | `map(string)` | `{}` | no |
| threshold | The threshold for the metric alarm | `string` | `"99.5"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cpu\_metric\_alarm\_arn | The ARN of the cpu metric alarm |
| cpu\_metric\_alarm\_id | The ID of the cpu metric alarm |
| mem\_metric\_alarm\_arn | The ARN of the mem metric alarm |
| mem\_metric\_alarm\_id | The ID of the mem metric alarm |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
