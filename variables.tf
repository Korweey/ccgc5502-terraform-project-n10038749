variable "humber_id" {
  description = "Student ID used to prefix/uniquely name all resources"
  type        = string
  default     = "n10038749"
}

variable "location" {
  description = "Azure region for all resources (must support availability zones)"
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Environment tag value"
  type        = string
  default     = "Learning"
}

variable "project_tag" {
  description = "Project tag value"
  type        = string
  default     = "CCGC 5502 Terraform Project"
}

variable "owner_name" {
  description = "Your name for the Name tag (firstname.lastname)"
  type        = string
  default     = "qawiyy.rabiu"
}

variable "admin_username" {
  description = "Admin username for VM logins"
  type        = string
  default     = "azadmin"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key for Linux VM login"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key for the hostname provisioner"
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "windows_admin_password" {
  description = "Admin password for the Windows VM (set via TF_VAR_windows_admin_password)"
  type        = string
  sensitive   = true
}

variable "db_admin_password" {
  description = "Admin password for the PostgreSQL server (set via TF_VAR_db_admin_password)"
  type        = string
  sensitive   = true
}
variable "vnet_address_space" {
  description = "Virtual network address space"
  type        = list(string)
  default     = ["10.1.0.0/16"]
}

variable "subnet_prefixes" {
  description = "Subnet address prefixes"
  type        = list(string)
  default     = ["10.1.1.0/24"]
}

variable "linux_vm_size" {
  description = "Linux VM size"
  type        = string
  default     = "Standard_F1ads_v7"
}

variable "windows_vm_size" {
  description = "Windows VM size"
  type        = string
  default     = "Standard_F2ads_v7"
}

variable "windows_vm_count" {
  description = "Number of Windows VMs"
  type        = number
  default     = 1
}

variable "linux_image_publisher" {
  description = "Linux image publisher"
  type        = string
  default     = "Canonical"
}

variable "linux_image_offer" {
  description = "Linux image offer"
  type        = string
  default     = "ubuntu-24_04-lts"
}

variable "linux_image_sku" {
  description = "Linux image SKU"
  type        = string
  default     = "server"
}

variable "windows_image_publisher" {
  description = "Windows image publisher"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "windows_image_offer" {
  description = "Windows image offer"
  type        = string
  default     = "WindowsServer"
}

variable "windows_image_sku" {
  description = "Windows image SKU"
  type        = string
  default     = "2022-datacenter-g2"
}

variable "data_disk_size_gb" {
  description = "Size of each data disk in GB"
  type        = number
  default     = 10
}

variable "law_retention_days" {
  description = "Log Analytics retention in days"
  type        = number
  default     = 30
}

variable "lb_sku" {
  description = "Load balancer SKU"
  type        = string
  default     = "Standard"
}

variable "lb_probe_port" {
  description = "Load balancer health probe port"
  type        = number
  default     = 80
}

variable "lb_frontend_port" {
  description = "Load balancer frontend port"
  type        = number
  default     = 80
}

variable "lb_backend_port" {
  description = "Load balancer backend port"
  type        = number
  default     = 80
}

variable "db_pg_version" {
  description = "PostgreSQL major version"
  type        = string
  default     = "16"
}

variable "db_sku_name" {
  description = "PostgreSQL server SKU"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "db_storage_mb" {
  description = "PostgreSQL storage in MB"
  type        = number
  default     = 32768
}

variable "db_backup_retention_days" {
  description = "PostgreSQL backup retention in days"
  type        = number
  default     = 7
}

variable "db_location" {
  description = "Region for the PostgreSQL server (no PostgreSQL offer for this subscription in eastus)"
  type        = string
  default     = "canadacentral"
}
