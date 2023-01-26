locals {
  rg_name   = "${var.business_unit}-${var.environment}-${var.resource_group_name}"
  vnet_name = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"
  #subnet_name = "${azurerm_virtual_network.tfvnet.name}-${var.subnet_name}"
  #sg_account_name = "sg-${var.business_unit}-${var.environment}-${var.resource_group_name}-${random_string.sgrand.id}"
  #sg_account_name = "${var.business_unit}${var.environment}${var.storage_account_name}"
  snet_name    = "${var.business_unit}-${var.environment}-${var.subnet_name}"
  pip_name     = "${var.business_unit}-${var.environment}-${var.publicip_name}"
  nic_name     = "${var.business_unit}-${var.environment}-${var.network_interface_name}"
  vm_name      = "${var.business_unit}-${var.environment}-${var.virtual_machine_name}"
  service_name = "test service"
  owner        = "ankit srivastava"

  common_tags = {
    Service = local.service_name
    Owner   = local.owner
  }

}