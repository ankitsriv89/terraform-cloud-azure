#input variables

# 1. business unit name
variable "business_unit" {
  description = "Business unit name"
  type        = string
  default     = "hr"

}

# 2. Environment name
variable "environment" {
  description = "Environment Name"
  type        = string
  default     = "dev"
}

# 3. Resource group name
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "myrg"
}

# 4. Resource group location
variable "resource_group_location" {
  description = "Resource Group Location"
  type        = string
  default     = "centralindia"
}

/*variable "storage_account_name" {
  description = "Name of storage account"
  type        = string
}*/

# 5. Virtual network name
variable "virtual_network_name" {
  description = "virtual network name"
  type        = string
  default     = "tfvnet"

}

variable "subnet_name" {
  description = "subnet name"
  type        = string
}

variable "publicip_name" {
  description = "Public IP Name"
  type        = string
}
# 8. Network Interfance
variable "network_interface_name" {
  description = "Network Interface Name"
  type        = string
}

# 9. Virtual Machine Name
variable "virtual_machine_name" {
  description = "Virtual Machine Name"
  type        = string
}

