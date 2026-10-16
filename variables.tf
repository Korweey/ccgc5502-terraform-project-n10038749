variable "humber_id" {
  description = "Student ID used to prefix/uniquely name all resources"
  type        = string
  default     = "n10038749"
}

variable "location" {
  description = "Azure region for all resources (must support availability zones)"
  type        = string
  default     = "canadacentral"
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