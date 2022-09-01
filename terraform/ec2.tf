resource "aws_network_interface" "network_interface" {
  subnet_id   = aws_subnet.private_subnet.id
  security_groups = [aws_security_group.instance_security_groups.id]

  tags = {
    Name = "${var.application}-${var.environment}-network-interface"
  }
}

resource "aws_instance" "builder" {
  ami           = "ami-03657b56516ab7912"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.network_interface.id
    device_index         = 0
  }
  }

  provisioner "file" {
    source      = "todo.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /tmp/todo.sh",
      "sudo /tmp/web.sh"
    ]
  }

  key_name      = aws_key_pair.TF-key.key_name
  # security_groups = [aws_security_group.instance_security_groups.name]


  depends_on = [aws_vpc.main, aws_key_pair.TF-key]
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "TF-key" {
  key_name   = "dovekey"
  public_key = tls_private_key.pk.public_key_openssh
  }
    

resource "dovekey" "ssh_key" {
  filename = dovekey
  content  = tls_private_key.pk.private_key_pem
}
