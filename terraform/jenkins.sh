#!/bin/bash

#remove pre-existing version of certbot
sudo yum remove certbot

#install Java, Nginx, and Jenkins
sudo yum update -y
sudo amazon-linux-extras install java-openjdk11 nginx1 -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins -y

#configure nginx as a reverse proxy to allow access over port 80
cat >> jenkins.conf << EOF
server {
    listen 80 default;
    server_name jenkins_server;
    location / {
        proxy_pass http://127.0.0.1:8080/;
    }
}
EOF
sudo mv jenkins.conf /etc/nginx/conf.d/jenkins.conf
#start and enable Jenkins/Nginx
sudo systemctl start nginx && sudo systemctl enable nginx
sudo systemctl start jenkins && sudo systemctl enable jenkins

#install certbot
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y \
    && sudo yum install certbot python-certbot-nginx -y

#obtain and install SSL certificate; only works if DNS is configured
#sudo certbot -d jec2nkins.mivancic.com


