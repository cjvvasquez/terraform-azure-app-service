terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }

  #backend "" {}
}

provider "azurerm" {
  features {}

  client_id       = "0ad7047b-f80d-47bc-b8fb-08441854f8a5"
  client_secret   = var.client_secret
  tenant_id       = "d2e93b13-5a75-4431-ac08-eea488f9779b"
  subscription_id = "21c24c5b-0b2f-4c10-a2fb-db612f726d74"

}