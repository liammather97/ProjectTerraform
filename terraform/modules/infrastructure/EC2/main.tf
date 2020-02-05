resource "aws_instance" "master" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  user_data = "${file("${var.bootstrap_path}")}"
  vpc_security_group_ids = ["${var.securitygroup}"]
  subnet_id = var.public_subnet_id
  associate_public_ip_address =true
  tags = {
      Name  = "master"
  }


  provisioner "remote-exec" {
    inline = [
      "docker swarm init > 1.txt",
      "tail -n +5 1.txt > 2.txt",
      "tail -c +5 2.txt > 3.txt",
      "head -n -3 3.txt > /etc/master-token.txt"
      ]
    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = "${file("~/.ssh/docker-key.pem")}"
      host     = "${self.public_ip}"
    }
  }
  provisioner "local-exec" {
    command = "scp -i 'docker-key.pem' ubuntu@${self.public_ip}:/etc/master-token.txt /home/qaadmin/Desktop/Terraform-Final/terraform/modules/infrastructure/master-token.txt"
  }
}
