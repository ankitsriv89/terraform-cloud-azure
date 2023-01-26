# 1. Output Values for Resource Group Resource
output "resource_group_id" {
  description = "Resource Group ID"
  # Attribute Reference
  value = azurerm_resource_group.myrg.id
}
output "resource_group_name" {
  description = "Resource Group Name"
  # Argument Reference
  value = azurerm_resource_group.myrg.name
}

# 2. Output Values for Virtual Network Resource
output "virtual_network_name" {
  description = "Virtal Network Name"
  value       = azurerm_virtual_network.tfvnet.name

}


output "vm_admin_user" {
  description = "My Virtual Machine Admin User"
  value       = azurerm_linux_virtual_machine.linuxvm1.admin_username
}


# 3. Output Values - Virtual Machine
output "vm_public_ip_address" {
  description = "My Virtual Machine Public IP"
  value       = azurerm_linux_virtual_machine.linuxvm1.public_ip_address
}

