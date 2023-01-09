#!/bin/bash
echo $(date +"%Y-%m-%d_%H-%M-%S") 2>&1 | tee -a /var/log/userdata/install.log
echo "Creating Userdata Log Directories" 2>&1 | tee -a /var/log/userdata/install.log
sudo mkdir /var/log/userdata 2>&1 | tee -a /var/log/userdata/install.log
chod 777 /var/log/userdata 2>&1 | tee -a /var/log/userdata/install.log

# Update OS
echo "Updating OS" 2>&1 | tee -a /var/log/userdata/install.log
sudo yum update -y 2>&1 | tee -a /var/log/userdata/install.log

# Install Docker
echo "Installing Docker" 2>&1 | tee -a /var/log/userdata/install.log
sudo yum install -y tmux wget docker 2>&1 | tee -a /var/log/userdata/install.log

# Enable Docker on boot
echo "Enabling Docker on Boot" 2>&1 | tee -a /var/log/userdata/install.log
sudo systemctl start docker 2>&1 | tee -a /var/log/userdata/install.log
sudo systemctl enable docker 2>&1 | tee -a /var/log/userdata/install.log

# Adding users to Docker group
echo "Adding users to Docker group" 2>&1 | tee -a /var/log/userdata/install.log
sudo usermod -aG docker root 2>&1 | tee -a /var/log/userdata/install.log
sudo usermod -aG docker ec2-user 2>&1 | tee -a /var/log/userdata/install.log

# Installing Docker Cmpose
echo "Installing Docker Cmpose" 2>&1 | tee -a /var/log/userdata/install.log
wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose

# Finished
echo $(date +"%Y-%m-%d_%H-%M-%S") 2>&1 | tee -a /var/log/userdata/install.log
echo "Finished!!!" 2>&1 | tee -a /var/log/userdata/install.log
