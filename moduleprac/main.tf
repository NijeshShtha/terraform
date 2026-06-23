module "rg" {
  source = "./modules/rg"
}

module "exampleacc" {
  source = "./modules/sotrageaccount"
  rg_name = module.rg.rg
}