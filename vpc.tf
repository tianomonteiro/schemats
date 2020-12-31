terraform {
  required_version = "= 0.12"
}

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

output {
  resource_id = "${null_resource.echourl.id}"
  resource_name = "URL de Administração do uCloud"
  resource_controller_url =  "${var.url}"
