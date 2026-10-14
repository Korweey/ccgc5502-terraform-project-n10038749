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
