resource "aws_instance" "jenkins" {
  ami           = "ami-0faab6bdbac9486fb"
  instance_type = "t3.micro"

  subnet_id = data.aws_subnet.public_a.id

  vpc_security_group_ids = [
    aws_security_group.jenkins_sg.id
  ]

  key_name = "devops_frankfurt-new-key"

  user_data = file("jenkins.sh")

  tags = {
    Name = "jenkins-server"
  }
}
