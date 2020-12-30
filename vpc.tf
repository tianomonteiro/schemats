variable "url" {
}

resource "null_resource" "echourl" {
  count      = "1"

  provisioner "local-exec" {
    command = "echo ${var.url}"
  }
}

output "url" {
  value = "${var.url}"
}

output {
   resource_id = null_resource.echourl.id
   resource_name = "URL de Administração do uCloud"
   resource_controller_url =  "${var.url}"
}
