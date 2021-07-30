variable "url" {
}

variable "ibmcloud_iam_key" {
}

resource "null_resource" "echourl" {

  provisioner "local-exec" {
    command = "echo ${var.url}"
  }
}

#resource "ibm_compute_vm_instance" "terraform-bm-bb-poc" {
#  hostname             = "bm-bb-poc"
#  domain               = "IBM-PoC-BB.cloud"
#  os_reference_code    = "CENTOS_8_64"
#  datacenter           = "dal13"
#  network_speed        = 10
#  hourly_billing       = true
#  local_disk           = false
#  private_network_only = true
#  flavor_key_name      = "AC1_8X60X25"

  // It should be false
#  dedicated_acct_host_only = false
#  notes                    = "VM notes"
#}

resource "null_resource" "curlurl" {

  provisioner "local-exec" {
    command = <<EOF
    export TOKEN=$(curl --location --request POST 'https://iam.cloud.ibm.com/identity/token' --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --data-urlencode 'grant_type=urn:ibm:params:oauth:grant-type:apikey' --data-urlencode 'apikey=${var.ibmcloud_iam_key}' | awk -F\" '/access_token/{print $4}')
	echo $TOKEN
	curl --location --request POST 'https://support-center.cloud.ibm.com/case-management/v1/cases' --header 'Content-Type: application/json' --header 'Authorization: Bearer $TOKEN' --data-raw '{ "type": "technical",
  "subject": "Case subject API Test",
  "description": "Case description API to Test",
  "severity":4,
   "offering": {
    "name": "Virtual Server for Classic",
    "type": {
      "group": "crn_service_name",
      "key": "virtual-server-group",
      "kind": "iaas",
      "id": "virtual-server-group"
    }
  },
  "resources": [
    {
      "crn": "120473408"
    }
  ]
}'
    EOF
  }
}


output "cpd_url" {
  value = "${var.url}"
}

#output "vm-id" {
#  value = "${ibm_compute_vm_instance.terraform-bm-bb-poc.id}"
#}

output "resource_cloud" {
		value = {
			   "is_resource" = "true"
			   "resource_controller_url" = "${var.url}"
			   "resource_icon_url" = "https://globalcatalog.test.cloud.ibm.com/api/v1/1082e7d2-5e2f-0a11-a3bc-f88a8e1931fc/artifacts/cache/8c6189a76c7d346f6e807aaffb3bf643-public/terraform.svg"
			   "resource_id" = "${null_resource.echourl.id}"
			   "resource_name" = "uCloudAdminConsole"
		}
	}
