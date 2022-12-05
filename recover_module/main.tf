locals {
 backup_sas_url = "${AZURE_STORAGE_BACKUP_PATH}"
}

data "azurerm_storage_account_blob_container_sas" "backup_sas" {
  connection_string = var.backup_sas_url
  container_name    = "${CONTAINER_NAME}"
  https_only        = true

  start  = "2022-12-05T10:00:00+12:00"
  expiry = "2023-12-05T10:00:00+12:00"

  permissions {
    read   = true
    add    = false
    create = false
    write  = true
    delete = true
    list   = true
  }
}



resource "azurerm_app_service" "aas" {
  name                = "aas"
  resource_group_name = azurerm_resource_group.aas.name
  location            = azurerm_service_plan.aas.location
  service_plan_id     = azurerm_service_plan.aas.id

  site_config {}

  backup {
    name                = "example-backup"
    enabled             = true
    storage_account_url = local.backup_sas_url

    schedule {
      frequency_interval       = 1
      frequency_unit           = "Day"
      retention_period_in_days = 30
      start_time               = "2022-12-05T11:00:00+12:00"
    }
  }
}