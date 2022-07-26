# Create the resource group
resource "azurerm_resource_group" "devops-rg" {
  name   = var.azurerm_resource_group_name
    location = var.azurerm_resource_group_location
}
# Create the Linux App Service Plan 
resource "azurerm_app_service_plan" "appserviceplan" {
  name = var.azurerm_app_service_plan_name
  location            = "${var.azurerm_resource_group_location}"
  resource_group_name = var.azurerm_resource_group_name 
   kind = "Linux" 
  reserved = "true"
  sku {
    tier = "Free"
    size = "F1"
  }
  tags = {
    "Environment" = var.Environment
  }
}
# create web-app-service by using python
resource "azurerm_app_service" "aleti88-devops" {
  name                = var.azurerm_app_service_name
  location            = var.azurerm_resource_group_location
  resource_group_name = var.azurerm_resource_group_name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

 
 tags = {
    "Environment" = var.Environment
 }
}