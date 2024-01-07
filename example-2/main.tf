# Creates EC2 instance along with creation of key pair. Runs remote-exec
resource "aws_instance" "webserver" {
  count = 3
  // ami           = try(var.ami,[]) ? var.ami : "ami-041feb57c611358bd" // "ami-01c647eace872fc02" AWS Amazon x86_64
  ami = try(var.ami,"ami-041feb57c611358bd")
  instance_type ="t2.micro"
  # https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec 
  provisioner "remote-exec" {
    on_failure = continue
    inline = [ 
        "docker version > /tmp/docker.version"
     ]
  }
# Establishes connection to be used by all
# generic remote provisioners (i.e. file/remote-exec)
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file(local_file.tf-key.filename)
  }
  key_name = aws_key_pair.web.id
  //vpc_security_group_ids = [aws_security_group.ssh-access.id]

# If when = destroy is specified, the provisioner will run when the resource it is defined within is destroyed. 
/*
   provisioner "local-exec" {
    when    = destroy
    command = "echo 'Destroy-time provisioner'"
  }
*/  
}

resource "aws_key_pair" "web" {
  key_name = "tf-key-pair"
  public_key = tls_private_key.rsa.public_key_openssh
  }
  
resource "tls_private_key" "rsa" {
    algorithm = "RSA"
    rsa_bits  = 4096
  }

resource "local_file" "tf-key" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "~/.ssh/tf-key-pair"
    file_permission = "0600"
    // directory_permission = "0644"
    // provisioner "local-exec" {
    // command = "chmod 644 ./.ssh/tf-key-pair"
    // }
}

output "server_public_ipv4" {
    value = aws_instance.webserver.public_ip
}

/*
resource "aws_security_group" "ssh-access" {
  
}


resource "aws_eip" "elastic_ip" {
  
}

*/