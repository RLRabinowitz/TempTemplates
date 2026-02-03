variable "region" {
  type = string
}

resource "oci_core_instance" "this" {
  # Minimal configuration - add required attributes as needed
  availability_domain = "${var.region}-AD-1"
  compartment_id      = "placeholder-compartment-id"
  shape               = "VM.Standard.E4.Flex"

  display_name = "instance-${var.region}"
}
