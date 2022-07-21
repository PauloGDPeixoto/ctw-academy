# Create virtual network
resource "azurerm_virtual_network" "prometheusNetwork" {
  name                = "prometheusVnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

# Create subnet
resource "azurerm_subnet" "prometheusSubnet" {
  name                 = "prometheusSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.prometheusNetwork.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "prometheusPublicIP" {
  name                = "prometheusPublicIP"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "ctwacademy-prometheus"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "prometheusNSG" {
  name                = "prometheusSecurityGroup"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Prometheus"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "9090"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Alertmanager"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "9093"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Grafana"
    priority                   = 1004
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Node Exporter"
    priority                   = 1005
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "9100"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "prometheusNIC" {
  name                = "prometheusNIC"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "prometheusNicConfiguration"
    subnet_id                     = azurerm_subnet.prometheusSubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.prometheusPublicIP.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "prometheusInterfaceNIC" {
  network_interface_id      = azurerm_network_interface.prometheusNIC.id
  network_security_group_id = azurerm_network_security_group.prometheusNSG.id
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "prometheusStorageAccount" {
  name                     = "prometheusstorage"
  location                 = var.resource_group_location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "prometheusVM" {
  name                  = "prometheusVM"
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.prometheusNIC.id]
  size                  = "Standard_D4_v3"

  os_disk {
    name                 = "prometheusOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "prometheusVM"
  admin_username                  = "ctwacademy"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "ctwacademy"
    public_key = file("../../resources/id_rsa.pub")
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.prometheusStorageAccount.primary_blob_endpoint
  }
}
