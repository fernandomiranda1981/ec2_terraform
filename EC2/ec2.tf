
resource "aws_instance" "meuec2" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id = var.subnet
  key_name        = "projeto_terraform"
  vpc_security_group_ids = ["${aws_security_group.allowssh.id}"]
  # security_groups = ["${aws_security_group.allowssh.id}"]
  tags = {
    Name = "terraform_ec2"
  }

}