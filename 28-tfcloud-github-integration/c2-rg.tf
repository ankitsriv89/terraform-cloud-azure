# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  name = local.rg_name

  location = var.resource_group_location
  tags     = local.common_tags
}
/* 
we can also use each.value as each.key = each.value 
in this case  
*/