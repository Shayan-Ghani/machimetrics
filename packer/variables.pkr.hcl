variable "vcenter_username" {
  type    = string
  description = "The username for authenticating to vCenter."
  default = "administrator@host1.local"
  sensitive = true
}

variable "vcenter_password" {
  type    = string
  description = "The plaintext password for authenticating to vCenter."
  default = "$Hayan9023"
  sensitive = true
}

variable "ssh_username" {
  type    = string
  description = "The username to use to authenticate over SSH."
  default = "ubuntu"
  sensitive = true
}

variable "ssh_password" {
  type    = string
  description = "The plaintext password to use to authenticate over SSH."
  default = "ubuntu" 
  sensitive = true
}

# vSphere Objects

variable "vcenter_insecure_connection" {
  type    = bool
  description = "If true, does not validate the vCenter server's TLS certificate."
  default = true
}

variable "vcenter_server" {
  type    = string
  description = "The fully qualified domain name or IP address of the vCenter Server instance."
  default = "photon-machine"
}

variable "vcenter_datacenter" {
  type    = string
  description = "Required if there is more than one datacenter in vCenter."
  default = "IT"
}

variable "vcenter_host" {
  type = string
  description = "The ESXi host where target VM is created."
  default = "192.168.1.66"
}

variable "vcenter_cluster" {
  type = string
  description = "The cluster where target VM is created."
  default = "cluster1"
}

variable "vcenter_datastore" {
  type    = string
  description = "Required for clusters, or if the target host has multiple datastores."
  default = "datastore1"
}

variable "vcenter_network" {
  type    = string
  description = "The network segment or port group name to which the primary virtual network adapter will be connected."
  default = "VM Network"
}

variable "vcenter_folder" {
  type    = string
  description = "The VM folder in which the VM template will be created."
  default = "Templates"
}

# ISO Objects

variable "iso_path" {
  type    = string
  description = "The path on the source vSphere datastore for ISO images."
  default = "imgs"
  }

# variable "iso_url" {
#   type    = string
#   description = "The url to retrieve the iso image"
#   default = ""
#   }

variable "iso_file" {
  type = string
  description = "The file name of the guest operating system ISO image installation media."
  default = "ubuntu-20.04.4-live-server-amd64.iso"
}

# variable "iso_checksum" {
#   type    = string
#   description = "The checksum of the ISO image."
#   default = ""
# }

# variable "iso_checksum_type" {
#   type    = string
#   description = "The checksum type of the ISO image. Ex: sha256"
#   default = ""
# }

# HTTP Endpoint

variable "http_directory" {
  type    = string
  description = "Directory of config files(user-data, meta-data)."
  default = "http"
}

# Virtual Machine Settings

variable "vm_name" {
  type    = string
  description = "The template vm name"
  default = "ubuntu2004-Template-30GB"
}

variable "vm_guest_os_type" {
  type    = string
  description = "The guest operating system type, also know as guestid."
  default = "ubuntu64Guest"
}

variable "vm_version" {
  type = number
  description = "The VM virtual hardware version."
  default = 14
  # https://kb.vmware.com/s/article/1003746
}

variable "vm_firmware" {
  type    = string
  description = "The virtual machine firmware. (e.g. 'bios' or 'efi')"
  default = "bios"
}

variable "vm_cdrom_type" {
  type    = string
  description = "The virtual machine CD-ROM type."
  default = "sata"
}

variable "vm_cpu_sockets" {
  type = number
  description = "The number of virtual CPUs sockets."
  defaults = 1
}

variable "vm_cpu_cores" {
  type = number
  description = "The number of virtual CPUs cores per socket."
  default = 1
}

variable "vm_mem_size" {
  type = number
  description = "The size for the virtual memory in MB."
  default = 1024
}

variable "vm_disk_size" {
  type = number
  description = "The size for the virtual disk in MB."
  default = 25000
}

variable "thin_provision" {
  type = bool
  description = "Thin or Thick provisioning of the disk"
  default = true
}

variable "disk_eagerly_scrub" {
  type = bool
  description = "eagrly scrub zeros"
  default = false
}

variable "vm_disk_controller_type" {
  type = list(string)
  description = "The virtual disk controller types in sequence."
  default = ["pvscsi"]
}

variable "vm_network_card" {
  type = string
  description = "The virtual network card type."
  default = "vmxnet3"
}

variable "vm_boot_wait" {
  type = string
  description = "The time to wait before boot. "
  default = "5s"
}

variable "shell_scripts" {
  type = list(string)
  description = "A list of scripts."
  default = ["./scripts/setup_ubuntu2004_withDocker.sh"]
}

##################################################################################
# LOCALS
##################################################################################

locals {
  buildtime = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
}