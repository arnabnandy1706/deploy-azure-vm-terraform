resource "aws_instance" "my-test-instance" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "t2.medium"
  key_name        = "${var.key_pair}"
  vpc_security_group_ids = ["sg-050ed780b5af3d41c"]

  tags {
    Name = "${var.instance_name}"
  }

  provisioner "remote-exec" {
    connection {
      type	=  "ssh"
      user	=  "ubuntu"
      private_key	=  "${"file(~/Documents/Freelancing/OnlineTrainings/Terraform/AWS_US-West.pem)"}"
    }

    inline = [
      "sudo apt-get update",
      "sudo apt-get install openjdk-8-jdk -y",
      "wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -",
      "sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'",
      "sudo apt-get update",
      "sudo apt-get install jenkins",
      "sudo systemctl start jenkins && sudo systemctl enable jenkins"
    ]
  }
}


