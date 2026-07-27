resource "azurerm_virtual_network" "vnte" {
    for_each = var.vnet_var
    name = each.value.vnet_name
    location = each.value.location
    resource_group_name = each.value.rg_name
    address_space = each.value.add_space
}