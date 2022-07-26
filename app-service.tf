# Create the resource group
resource "azurerm_resource_group" "devops-rg" {
  name    = "test-rg"
  location = "East US"
}
# Create the Linux App Service Plan 
resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "simple-p"
  location            = azurerm_resource_group.devops-rg.location
  resource_group_name = azurerm_resource_group.devops-rg.name
  kind = "Linux"
  reserved = "true"
  sku {
    tier = "Free"
    size = "F1"
  }
  tags = {
    "Environment" = "test"
  }
}
# create web-app-service by using python
resource "azurerm_app_service" "aleti88-devops" {
  name                = "aleti88-app"
  location            = azurerm_resource_group.devops-rg.location
  resource_group_name = azurerm_resource_group.devops-rg.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

 
 tags = {
    "Environment" = "test"
 }
}