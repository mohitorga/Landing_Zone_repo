data "azurerm_network_interface" "data_name" {
    for_each = var.vm_var
    name = each.value.nic_name
    resource_group_name = each.value.rg_name
  
}