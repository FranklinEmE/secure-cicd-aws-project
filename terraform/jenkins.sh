#!/bin/bash
set -eux

# Update system
apt update -y

# Install dependencies
apt install -y openjdk-17-jdk curl gnupg ca-certificates

# Add Jenkins GPG key (correct modern method)
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | gpg --dearmor -o /usr/share/keyrings/jenkins.gpg

# Add Jenkins repository (correct format)
echo "deb [signed-by=/usr/share/keyrings/jenkins.gpg] https://pkg.jenkins.io/debian-stable binary/" \
> /etc/apt/sources.list.d/jenkins.list

# Update again AFTER repo is added
apt update -y

# Install Jenkins
apt install -y jenkins

# Enable + start Jenkins
systemctl enable jenkins
systemctl start jenkins

# Install Docker
apt install -y docker.io

systemctl enable docker
systemctl start docker

# Add users to docker group
usermod -aG docker ubuntu || true
usermod -aG docker jenkins || true
