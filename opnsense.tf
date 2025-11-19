provider "proxmox" {
  pm_api_url = "https://192.168.4.50:8006/api2/json"
  pm_api_token_id = "terraform@pam!terraform"
  pm_api_token_secret = ""
  pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "my_new_vm" {
    name        = "opnsense-router"
    target_node = "effex-homelab" 
    clone       = "opnsense"    

    disks {
        scsi {
            scsi0 {
                disk {
                    storage = "local-lvm" 
                    size    = "32G"
                }
            }
        }
    }
    
    network {
        bridge = "vmbr0"
        model  = "virtio"
        id = 0
    }
    
    network {
        bridge = "vmbr1"
        model  = "virtio"
        id = 1
    }

    cpu {
        sockets = 1
        cores = 1
    }

    memory      = 2048     
    agent       = 0  
    boot        = "order=scsi0" 
}