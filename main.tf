
resource "azurerm_resource_group" "rg" {
  name     = "rg-webapp"
  location = "canadacentral"
}

resource "azurerm_service_plan" "service_plan" {
  name                = "aspwebapppp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "F1"
  os_type             = "Linux"
  worker_count        = 1
  always_on           = false
  depends_on          = [azurerm_resource_group.rg]
}

module "app-service" {
  source  = "Azure/avm-res-web-site/azurerm"
  version = "0.19.1"

  kind                        = "webapp"
  location                    = azurerm_resource_group.rg.location
  name                        = "webapplab"
  os_type                     = "Linux"
  resource_group_name         = azurerm_resource_group.rg.name
  service_plan_resource_id    = azurerm_service_plan.service_plan.id
  enable_application_insights = false
  enable_telemetry            = false

  depends_on = [azurerm_service_plan.service_plan]

}