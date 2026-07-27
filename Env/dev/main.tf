module "rg_module" {
  source = "../../Module/rg"
  rg_var = var.dev_var
}
module "vnet_module" {
  depends_on = [module.rg_module]
  source     = "../../Module/vnet"
  vnet_var   = var.dev_var
}

module "subnet_module" {
  depends_on = [module.vnet_module]
  source     = "../../Module/subnet"
  subnet_var = var.dev_var
}

module "nic_module" {
  depends_on = [module.subnet_module]
  source     = "../../Module/nic"
  nic_var    = var.dev_var

}
module "vm_module" {
  depends_on = [module.nic_module]
  source     = "../../Module/vm"
  vm_var     = var.dev_var
}