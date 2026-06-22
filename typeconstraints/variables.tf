variable "environment" {
  type = string
  description = "for environment"
  default = "dev"
}

variable "vm" {
  type = string
  description = "for virtual machine"
  default = "terraformvm"
}

#list
variable "allowed_location" {
  type = list(string)
  description = "location allowed"
  default = [ "West Europe", "East US", "Central US" ]
}

#map
variable "resource_tags" {
  type = map(string)
  default = {
    "environment" = "staging"
    "managed_by" = "terraform"
  }
}

#tuple
variable "network_config" {
  type = tuple([ string, string, number ])
  description = "for virtual network config"
  default = [ "terraform_network", "10.0.2.0", 24 ]
}

#object
variable "os_config" {
  type = object({
    name              = string
    caching           = string
    create_option     = string
    managed_disk_type = string
  })

  description = "for os config"

  default = {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
}