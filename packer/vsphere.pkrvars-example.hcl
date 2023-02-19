##################################################################################
# VARIABLES
##################################################################################

# Credentials

vcenter_username                = "administrator@host1.local"
vcenter_password                = "$Hayan9023"

# vSphere Objects

vcenter_insecure_connection     = true
vcenter_server                  = "photon-machine"
vcenter_datacenter              = "IT"
vcenter_host                    = "192.168.1.66"
vcenter_datastore               = "datastore1"
vcenter_network                 = "VM Network"
vcenter_folder                  = "Templates"

# ISO Objects
iso_path                        = "[datastore1] /packer_cache/ubuntu-22.04.1-live-server-amd64.iso"
