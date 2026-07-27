resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.vm_var
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = "Standard_D2s_v3"
  admin_username      = each.value.usr_name
  admin_password = each.value.usr_pass
  disable_password_authentication = false
  network_interface_ids = [data.azurerm_network_interface.data_name[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}