variable "resource_group_name" {
  default     = "cicd-academy-rg"
  description = "Resource group name."
}

variable "resource_group_location" {
  default     = "westeurope"
  description = "Location of the resource group."
}


variable "azure_backend_storage" {
  default     = "tfstateprometheus"
  description = "Name of the storage account and container for the tfstate file"
}
