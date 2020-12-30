variable "url" {
}

resource "null_resource" "echourl" {

  provisioner "local-exec" {
    command = "echo ${var.url}"
  }
}

output "url" {
  value = "${null_resource.echourl.id}"
}

output "resources" {
  resource_id = "${null_resource.echourl.id}"
  resource_name = "URL de Administração do uCloud"
  resource_controller_url =  "${var.url}"
}
