variable "name" {
  type        = string
  description = "The service name."
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the metric alarms."
  default     = {}
}

variable "enable_metric_alarm" {
  type        = bool
  description = "Enable the metric alarm"
  default     = true
}

variable "actions_enabled" {
  type        = bool
  description = "Enable the actions. Set to false to temporarily disable actions."
  default     = true
}

variable "actions_alarm" {
  type        = list(string)
  description = "List of alarm actions to take"
  default     = []
}

variable "actions_ok" {
  type        = list(string)
  description = "List of ok actions to take"
  default     = []
}

variable "actions_insufficient_data" {
  type        = list(string)
  description = "List of insufficient data actions to take"
  default     = []
}

variable "ecs_cluster_name" {
  type        = string
  description = "The ECS Cluster name for use with CloudWatch Metrics."
}

variable "ecs_service_name" {
  type        = string
  description = "The ECS Service name for use with CloudWatch Metrics."
}

variable "threshold_cpu" {
  type        = string
  description = "The threshold for the cpu metric alarm"
  default     = "80.0"
}

variable "threshold_mem" {
  type        = string
  description = "The threshold for the mem metric alarm"
  default     = "80.0"
}
