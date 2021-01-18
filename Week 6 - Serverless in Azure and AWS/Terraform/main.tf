provider "azurerm" {
  features {}
}

resource "azurerm_app_service_plan" "cloudskills-sp" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "cloudskills-as" {
  name                = var.app_service_name
  location            = azurerm_app_service_plan.cloudskills-sp.location
  resource_group_name = azurerm_app_service_plan.cloudskills-sp.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.cloudskills-sp.id
}