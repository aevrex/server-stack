terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc05" 
    }
  }
}