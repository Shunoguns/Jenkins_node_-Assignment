resource "aws_key_pair" "junekey"{
key_name        = "junekey"
public_key      = file(var.path_to_public_key)
}

resource "aws_instance" "Jenkins_node" {
    ami           = "ami-031a03cb800ecb0d5"
    instance_type = "t2.micro"
    key_name      = "junekey"
    subnet_id     = var.subnet_id
  
    tags          = {
    Name          = var.tag
  }

provisioner "remote-exec" {
    connection {
    type = "ssh"
    user = "ec2-user"
    host = aws_instance.Jenkins_node.public_ip
    private_key = file(var.path_to_private_key)
  }
    inline = [
      "sudo yum update -y",
      "sudo yum -y install nginx",
      "sudo service nginx start",
      "sudo yum install maven git -y",
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key",
      "sudo yum install jenkins -y",

    ]
  }
}
       
    

output "ip" {
  value = "https://${aws_instance.Jenkins_node.public_ip}:8080  connect ssh -i junekey ec2-user@${aws_instance.Jenkins_node.public_ip}"
}