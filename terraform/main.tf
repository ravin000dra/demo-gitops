provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "k8s_rg" {
  name     = "myK8SResourceGroup"
  location = "East US"
}

# Virtual Network
resource "azurerm_virtual_network" "k8s_vnet" {
  name                = "myK8SVNet"
  location            = azurerm_resource_group.k8s_rg.location
  resource_group_name = azurerm_resource_group.k8s_rg.name
  address_space       = ["10.0.0.0/16"]
}

# Subnet for Kubernetes Nodes
resource "azurerm_subnet" "k8s_subnet" {
  name                 = "myK8SSubnet"
  resource_group_name  = azurerm_resource_group.k8s_rg.name
  virtual_network_name = azurerm_virtual_network.k8s_vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

# VM for Master Node
resource "azurerm_linux_virtual_machine" "k8s_master" {
  name                 = "k8s-master-node"
  resource_group_name  = azurerm_resource_group.k8s_rg.name
  location             = azurerm_resource_group.k8s_rg.location
  size                 = "Standard_DS2_v2"
  admin_username       = "azureuser"
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
}
