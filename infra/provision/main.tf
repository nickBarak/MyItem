
provider "aws" {
  region = "us-west-2"
}

locals {
  all = {
    _local   = module._local._output,
    _data    = module._data._output,
    group    = module.group._output,
    security = module.security._output,
    network  = module.network._output,
    storage  = module.storage._output,
    compute  = module.compute._output,
  }
}

output "provision" {
  value = local.all
}

module "_local" {
  source = "./local"
  _global = {
    for key, val in local.all :
    key => val if key != "_local"
  }
}

module "_data" {
  source = "./data"
  _global = {
    for key, val in local.all :
    key => val if key != "_data"
  }
}

module "group" {
  source = "./module/group"
  _global = {
    for key, val in local.all :
    key => val if key != "group"
  }
}

module "security" {
  source = "./module/security"
  _global = {
    for key, val in local.all :
    key => val if key != "security"
  }
}

module "network" {
  source = "./module/network"
  _global = {
    for key, val in local.all :
    key => val if key != "network"
  }
}

module "storage" {
  source = "./module/storage"
  _global = {
    for key, val in local.all :
    key => val if key != "storage"
  }
}

module "compute" {
  source = "./module/compute"
  _global = {
    for key, val in local.all :
    key => val if key != "compute"
  }
}
