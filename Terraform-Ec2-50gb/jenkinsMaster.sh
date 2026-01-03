#!/bin/bash

#resize disk from 20GB to 50GB
growpart /dev/nvme0n1 4

lvextend -L +10G /dev/mapper/RootVG-varVol # cause /var is where jenkins data will be stored
lvextend -L +10G /dev/mapper/RootVG-rootVol # cause / is where jenkins will be installed
lvextend -l +100%FREE /dev/mapper/RootVG-homeVol # cause /home is where user data will be stored

xfs_growfs /
xfs_growfs /var
xfs_growfs /home

# installing jenkins repo
# sudo yum install -y wget
# use secure protocol tlsv1_2, or else it wont work . or use curl

# sudo wget --secure-protocol=TLSv1_2 -O /etc/yum.repos.d/jenkins.repo \
#     https://pkg.jenkins.io/redhat-stable/jenkins.repo

curl -o /etc/yum.repos.d/jenkins.repo \
     https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key    

# sudo yum upgrade -y

# installing java and jenkins
sudo yum install fontconfig java-21-openjdk -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins 

sudo cat /var/lib/jenkins/secrets/initialAdminPassword >> jenkins_password.txt

