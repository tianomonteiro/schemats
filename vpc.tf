variable "url" {
}

resource "null_resource" "echourl" {

  provisioner "local-exec" {
    command = "echo ${var.url}"
  }
}

resource "null_resource" "curlurl" {

  provisioner "local-exec" {
    command = "curl ${var.url}"
  }
}

resource "ibm_compute_vm_instance" "terraform-bm-bb-poc" {
  hostname             = "bm-bb-poc"
  domain               = "IBM-PoC-BB.cloud"
  os_reference_code    = "CENTOS_8_64"
  datacenter           = "dal13"
  network_speed        = 10
  hourly_billing       = true
  local_disk           = false
  private_network_only = true
  flavor_key_name      = "AC1_8X60X25"

  // It should be false
  dedicated_acct_host_only = false
  notes                    = "VM notes"
}

output "cpd_url" {
  value = "${var.url}"
}

output "resource_cloud" {
		value = {
			   "is_resource" = "true"
			   "resource_controller_url" = "${var.url}"
			   "resource_icon_url" = "https://globalcatalog.test.cloud.ibm.com/api/v1/1082e7d2-5e2f-0a11-a3bc-f88a8e1931fc/artifacts/cache/8c6189a76c7d346f6e807aaffb3bf643-public/terraform.svg"
			   "resource_id" = "${null_resource.echourl.id}"
			   "resource_name" = "uCloudAdminConsole"
		}
	}
