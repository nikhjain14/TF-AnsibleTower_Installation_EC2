// Creating ssh-key pair
resource "aws_key_pair" "RHEL-key" {
  key_name   = "RHEL-key"
  public_key = file("${path.module}/id_rsa.pub")
}
