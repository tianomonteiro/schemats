variable "url" {
}

resource "null_resource" "echourl" {

  provisioner "local-exec" {
    command = "echo ${var.url}"
  }
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
