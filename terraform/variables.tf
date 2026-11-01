variable "aws_region" {
  description = "AWS region where all resources are deployed."
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Project name, used as prefix for resource names and as a tag."
  type        = string
  default     = "nanlabs-challenge"

  validation {
    condition     = can(regex("^[a-z0-9-]{3,24}$", var.project))
    error_message = "project must be 3-24 characters: lowercase letters, numbers and hyphens."
  }
}

variable "environment" {
  description = "Environment name (e.g. dev, staging, prod)."
  type        = string
  default     = "dev"

  validation {
    condition     = can(regex("^[a-z0-9]{2,10}$", var.environment))
    error_message = "environment must be 2-10 lowercase alphanumeric characters."
  }
}
