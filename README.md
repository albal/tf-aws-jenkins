# tf-aws-jenkins

Setup the SSH key to be used for accessing the Jenkins EC2 Instance on AWS.  Note this key should have the public part copied into the ec2.tf file:

`ssh-keygen -t rsa -b 4096 -P "" -C "ec2-user@jenkins" -f key.pem`
