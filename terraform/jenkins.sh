#!/bin/bash
set -eux

apt update -y

apt install -y fontconfig openjdk-17-jdk curl gnupg ca-certificates

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee \
/usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

apt update -y
apt install -y jenkins

systemctl enable jenkins
systemctl start jenkins

apt install -y docker.io
systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu || true
usermod -aG docker jenkins || true
