variable "rg" {
  type = set(string)
  default = [ "resourcegroup1", "resourcegroup2" ]
}

variable "resource_locations" {
  type = list(string)
  default = [ "West Europe", "East US" ]
}

variable "resource_location" {
  type = string
  default = "West Europe"
}