variable "aks_cluster_name" {
  description = "AKS Cluster Name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region Location"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for AKS"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes Version"
  type        = string
  default     = "1.29.2"
}

variable "system_node_count" {
  description = "Initial node count for system pool"
  type        = number
  default     = 3
}

variable "min_node_count" {
  description = "Minimum node count for autoscaling"
  type        = number
  default     = 3
}

variable "max_node_count" {
  description = "Maximum node count for autoscaling"
  type        = number
  default     = 6
}

variable "system_vm_size" {
  description = "VM size for AKS system nodes"
  type        = string
  default     = "Standard_D4s_v5"
}

variable "availability_zones" {
  description = "Availability zones for HA"
  type        = list(string)
  default     = ["1", "2", "3"]
}

variable "vnet_subnet_id" {
  description = "Subnet ID for AKS node pool"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID for monitoring"
  type        = string
}

variable "acr_id" {
  description = "Azure Container Registry ID for AcrPull permission"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Resource Tags"
  type        = map(string)
  default     = {}
}
