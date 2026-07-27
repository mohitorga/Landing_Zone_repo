data "azurerm_subnet" "data_subnet" {
    for_each = var.nic_var
    name = each.value.subnet_name
    resource_group_name = each.value.rg_name
    virtual_network_name = each.value.vnet_name
}