variable "url" {
}

resource "null_resource" "echourl" {

  provisioner "local-exec" {
    command = "echo ${var.url}"
  }
}

output "url" {
  value = null_resource.echourl.id
}
