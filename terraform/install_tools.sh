#!/bin/bash

set -e

echo "Updating packages..."
sudo apt update -y

echo "Installing required dependencies..."
sudo apt install -y \
openjdk-17-jre \
fontconfig \
daemon \
docker.io \
curl \
wget \
unzip \
apt-transport-https \
gnupg \
lsb-release \
software-properties-common

echo "Starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Adding users to Docker group..."
sudo usermod -aG docker ubuntu

echo "Downloading Jenkins package..."
cd /tmp

wget https://pkg.jenkins.io/debian-stable/binary/jenkins_2.504.3_all.deb

echo "Installing Jenkins..."
sudo dpkg -i jenkins_2.504.3_all.deb || true

echo "Fixing broken dependencies..."
sudo apt --fix-broken install -y

echo "Starting Jenkins..."
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "Installing Trivy..."
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -

echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | \
sudo tee /etc/apt/sources.list.d/trivy.list

sudo apt update -y
sudo apt install -y trivy

echo "Installing AWS CLI..."
sudo snap install aws-cli --classic

echo "Installing kubectl..."
sudo snap install kubectl --classic

echo "Installing Helm..."
sudo snap install helm --classic

echo "Installation completed successfully."