#resource 2 : create virtual network
resource "azurerm_virtual_network" "tfvnet" {
  name                = local.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  tags                = local.common_tags
  /* lifecycle {
    prevent_destroy = true
  } */
}

resource "azurerm_subnet" "tfsubnet" {
  #name                 = var.subnet_name
  name                 = local.snet_name
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.tfvnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
#resource 4 : create public ip address
resource "azurerm_public_ip" "tfpublicip" {
  name                = local.pip_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   = "Static"
  domain_name_label   = "app1-${terraform.workspace}-${random_string.myrandom.id}"
  # Add Explicit Dependency to have this resource created only after Virtual Network and Subnet Resources are created. 
  depends_on = [
    azurerm_virtual_network.tfvnet,
    azurerm_subnet.tfsubnet
  ]

  tags = local.common_tags

}

# Resource-5: Create Network Interface
resource "azurerm_network_interface" "tfvmnic" {
  name                = local.nic_name
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.tfsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tfpublicip.id
  }
  tags = local.common_tags
}