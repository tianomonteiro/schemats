variable "url" {
}

resource "null_resource" "echourl" {

  provisioner "local-exec" {
    command = "echo ${var.url}"
  }
}

output "url" {
  value = "${var.url}"
}

output "resources" {
  resource_id = null_resource.echourl.id
  resource_name = "URL de Administração do uCloud"
  resource_controller_url =  "${var.url}"
}
