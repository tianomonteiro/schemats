variable "ibmcloud_api_key" {}

provider "ibm" {
  ibmcloud_api_key   = "${var.ibmcloud_api_key}"
  generation         = 2
  region             = "us-south"
}
