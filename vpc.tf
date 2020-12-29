variable "url" {
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
