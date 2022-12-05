terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0.0"
    }

    postgresql = {
      source = "cyrilgdn/postgresql"
      version = "1.18.0"
    }
    
  }
}



module "Recover" {
  source = "../recover_module"

}

output "data" {
  value = module.Rachels.out
  
}

