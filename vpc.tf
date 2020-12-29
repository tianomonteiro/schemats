variable "url" {
}

variable "var.ibmcloud_api_key" {
}

resource "null_resource" "echourl" {
  count      = "1"

  provisioner "local-exec" {
    command = "echo ${var.url}"
  }
}

output "url" {
  value = var.url
}
