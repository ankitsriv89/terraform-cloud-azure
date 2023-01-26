
resource "azurerm_linux_virtual_machine" "linuxvm1" {
  name                = local.vm_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  size                = "Standard_DS1_v2"
  admin_username      = "ankit"
  network_interface_ids = [
    azurerm_network_interface.tfvmnic.id,
  ]

  admin_ssh_key {
    username   = "ankit"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")


  }

  os_disk {
    name                 = "osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")

  tags = local.common_tags

  /* connection {
    type        = "ssh"
    host        = self.public_ip_address
    user        = self.admin_username
    private_key = file("${path.module}/ssh-keys/terraform-azure.pem")
  }

  # File Provisioner-4:
  provisioner "file" {
    source      = "apps/app3"
    destination = "/tmp"
    #on_failure  = continue
  }
  

  provisioner "remote-exec" {
    inline = [
      "sleep 120",
      "sudo cp -rv /tmp/app3 /var/www/html"
    ]
  } */
}