provider "proxmox" {
  pm_api_url          = "https://10.10.25.168:8006/api2/json"
#  pm_api_token_id     = "root@pam!token_id"
#  pm_api_token_secret = "bec3afc4-ac71-4078-a321-39d011d8dc1e"
pm_user        = "root@pam"
pm_password    = "12345"
}

resource "proxmox_vm_qemu" "proxmox_vm" {
  count             = 1
  name              = "tf-vm-${count.index}"
  target_node       = "myproxserver01"
clone             = "ubuntu-20-template"
  
  agent             = 1
  os_type           = "cloud-init"
  cores             = 4
  sockets           = "1"
  cpu               = "qemu64"
  memory            = 2048
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "scsi0"
disk {
    storage         = "local-lvm"
    size            = "20G"
    type            = "scsi"
  }
network {
    model           = "virtio"
    bridge          = "vmbr0"
  }
}

