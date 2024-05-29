provider "aws" {
  region = "ap-south-1"  # Change to your desired region
}
# Create an EC2 Instance for Ansible Control Node
resource "aws_instance" "stormer_ansible_control_node" {
  ami           = "ami-0cc9838aa7ab1dce7"  # Change to your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-03f39704c040dac27"
  key_name      ="arthur-stormer"
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-040e94be33ddc6dd5"]
  tags = {
    Name = "Stormer Ansible Control Node"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y python3 python3-pip",
      "pip3 install ansible"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"  # Adjust according to the AMI's default user
      private_key = file("/usr/local/bin/teraform-project/arthur.pem")  # Path to your private key file
      host        = self.public_ip
      timeout     = "2m"  #
    }
  }
}
output "public_ip" {
  value = aws_instance.stormer_ansible_control_node.public_ip
}
