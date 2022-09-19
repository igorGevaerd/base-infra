locals {
  tags = {
    managed-by = "terraform"
    project    = "${var.project}"
    stage      = "${var.env}"
    squad      = "${var.squad}"
  }
}