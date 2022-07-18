variable "resource_group_name" {
  default     = "cicd-academy-rg"
  description = "Resource group name."
}

variable "resource_group_location" {
  default     = "westeurope" # change to "germanywestcentral", if azure region quota limit has been exceeded
  description = "Location of the resource group."
}

variable "azure_subscription_id" {
  type        = string
  default     = "470bd2ee-0973-4f49-a719-dc721d0d6e4f"
  description = "Azure Account"
}

variable "arm_tenant_id" {
  type        = string
  description = "Azure tenant id"
  default     = "61f30b8e-4f6b-44fe-9bc2-041e3a9f7346"
}
