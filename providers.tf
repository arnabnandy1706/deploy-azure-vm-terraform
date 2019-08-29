provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
  instance_name	= "${var.instance-name}"
  key_pair	= "${var.key-pair}"

  version = "~> 1.7"
}
