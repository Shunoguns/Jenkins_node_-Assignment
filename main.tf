resource "aws_key_pair" "junekey"{
key_name        = "junekey"
public_key      = file(var.path_to_public_key)
}

resource "aws_instance" "Jenkins_node" {
    ami           = "ami-0ea3405d2d2522162"
    instance_type = "t2.micro"
    key_name      = "junekey"
    subnet_id     = var.subnet_id


    tags          = {
    Name          = var.tag
  }

provisioner "remote-exec"  {
  inline = [
      "sudo yum install git -y" , 
      "sudo yum install maven -y",
      "sudo yum install tomcat -y",
      "sudo yum install jenkins -y",
      ]
    
  }


}