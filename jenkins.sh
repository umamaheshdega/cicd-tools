#!/bin/bash
set -xe
DISK="/dev/xvda"
PART=4
VG_NAME="RootVG"
ROOT_LV="rootVol"
VAR_LV="varVol"
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
#resize disk from 20GB to 50GB
# growpart /dev/nvme0n1 
echo "🔧 Growing partition..."
growpart "$DISK" "$PART"

echo "🔄 Resizing physical volume..."
pvresize "${DISK}${PART}"

lvextend -L +10G /dev/RootVG/rootVol
lvextend -L +10G /dev/mapper/RootVG-varVol
lvextend -l +100%FREE /dev/mapper/RootVG-varTmpVol

xfs_growfs /
xfs_growfs /var/tmp
xfs_growfs /var


curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install fontconfig java-17-openjdk jenkins -y
yum install jenkins -y
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

