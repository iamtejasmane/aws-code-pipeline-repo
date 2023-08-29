#!/bin/bash

# AWS CodeDeploy Agent Installation Script

export AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="YOUR_SECRET_KEY"
export AWS_REGION="us-west-1" # Change this to your desired region

INSTALL_DIR="/opt/codedeploy-agent"

echo "Installing dependencies..."
sudo yum update -y
sudo yum install ruby wget -y

echo "Downloading CodeDeploy agent..."
cd /tmp
wget https://aws-codedeploy-${AWS_REGION}.s3.${AWS_REGION}.amazonaws.com/latest/install
chmod +x ./install

sudo ./install auto

sudo service codedeploy-agent start

sudo chkconfig codedeploy-agent on

# Clean up
echo "Cleaning up..."
rm ./install

echo "AWS CodeDeploy agent installation completed!"

# Note - give permission to file.
# run this command on aws-codedeploy directory 
# chmod +x install-codedeploy-agent.sh
