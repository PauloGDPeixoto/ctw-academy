output "public_ip_address" {
  value = azurerm_linux_virtual_machine.prometheusVM.public_ip_address
}

output "fqdn" {
  value = azurerm_public_ip.prometheusPublicIP.fqdn
}
