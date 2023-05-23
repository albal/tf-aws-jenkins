resource "null_resource" "cluster" {
  connection {
    host        = aws_instance.myapp-server.public_ip
    user        = "ec2-user"
    private_key = file("key.pem")
    type        = "ssh"
  }

  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the cluster
    inline = [
      "sleep 180s",
      "echo -n JENKINS ADMIN PASSWORD: ",
      "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
    ]
  }

  depends_on = [aws_instance.myapp-server]
}
