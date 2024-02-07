variable "resource_group_name" {
  type        = string
  default     = "cybersecurity-rg"
  description = "Resource group name."
}

variable "resource_group_location" {
  type        = string
  default     = "germanywestcentral" # change to "westeurope", if azure region quota limit has been exceeded
  description = "Location of the resource group."
}

variable "azure_subscription_id" {
  type        = string
  default     = "2d5ebd87-43d2-4406-8625-4fa518b48227"
  description = "Azure Account"
}

variable "arm_tenant_id" {
  type        = string
  description = "Azure tenant id"
  default     = "61f30b8e-4f6b-44fe-9bc2-041e3a9f7346"
}
