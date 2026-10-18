variable "rg_name" {
  description = "Resource group to deploy into"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.1.0.0/16"]
}

variable "subnet_prefixes" {
  description = "Address prefix(es) for the subnet"
  type        = list(string)
  default     = ["10.1.1.0/24"]
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}
variable "security_rules" {
  description = "Inbound NSG rules"
  type = list(object({
    name                       = string
    priority                   = number
    destination_port_range     = string
    direction                  = optional(string, "Inbound")
    access                     = optional(string, "Allow")
    protocol                   = optional(string, "Tcp")
    source_port_range          = optional(string, "*")
    source_address_prefix      = optional(string, "*")
    destination_address_prefix = optional(string, "*")
  }))
  default = [
    { name = "Allow-SSH", priority = 100, destination_port_range = "22" },
    { name = "Allow-RDP", priority = 110, destination_port_range = "3389" },
    { name = "Allow-WinRM", priority = 120, destination_port_range = "5985" },
    { name = "Allow-HTTP", priority = 130, destination_port_range = "80" },
  ]
}
