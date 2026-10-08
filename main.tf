# Resource Group
resource "azurerm_resource_group" "kaptan_rg" {
  name     = "kaptan-rg"
  location = "East US"
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "kaptan_aks" {
  name                = "kaptan-k8"
  location            = azurerm_resource_group.kaptan_rg.location
  resource_group_name = azurerm_resource_group.kaptan_rg.name
  dns_prefix          = "kaptanaks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s" # 💰 cheapest practical option
  }

  identity {
    type = "SystemAssigned"
  }

  # 🔥 Network (no public LB usage + Calico)
  network_profile {
    network_plugin    = "azure"
    network_policy    = "calico"
    load_balancer_sku = "standard"
  }

  # ❌ No monitoring enabled (default me disabled hi hota hai)

  tags = {
    environment = "dev"
  }
}