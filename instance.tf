//Get AMI image id
data "aws_ami" "RHEL" {
  most_recent = true
  owners      = ["309956199498"]

  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


// Create EC2 instance
resource "aws_instance" "RHEL-instance" {
  ami             = "${data.aws_ami.RHEL.id}"
  instance_type   = "${var.instance_type}"
  key_name        = "${aws_key_pair.RHEL-key.key_name}"
  security_groups = ["custom-sg"]

  tags = {
    Name = "RHEL-TF"
  }



// Installig Ansible Tower on same instance 
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("${path.module}/id_rsa")
    host     = "${self.public_ip}"
  }

  provisioner "file" {
       source = "ansibleTowerInstallation.sh"
       destination = "/tmp/ansibleTowerInstallation.sh"
  }

  provisioner "remote-exec" {
  inline = [
      "cd /tmp",
      "curl -O ${var.ansible_tower_tar_URL}",
      "tar xvfz /tmp/ansible-tower-*.tar.gz",
      "sudo sh /tmp/ansibleTowerInstallation.sh",
      "cd /tmp/ansible-tower-setup-*/",
      "sudo sh setup.sh",
  ]
  }

}
