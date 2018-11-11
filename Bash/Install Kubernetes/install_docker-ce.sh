# Instructions for installing Docker-CE on Ubuntu Server 18.04
# taken from
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

# Update your existing list of packages
sudo apt update

# Install a few prerequisite packages which let apt use packages over HTTPS
sudo apt install apt-transport-https ca-certificates curl software-properties-common

# Add the GPG key for the official Docker repository to your system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# update the package database with the Docker packages from the newly added repo
sudo apt update

# Make sure you are about to install from the Docker repo instead of the default Ubuntu repo
apt-cache policy docker-ce

# Expected output:
#docker-ce:
#  Installed: (none)
#  Candidate: 18.03.1~ce~3-0~ubuntu
#  Version table:
#     18.03.1~ce~3-0~ubuntu 500
#        500 https://download.docker.com/linux/ubuntu bionic/stable amd64 Packages

# install Docker
sudo apt install docker-ce

# Docker should now be installed, the daemon started, and the process enabled to start on boot. 
# Check that it's running
sudo systemctl status docker

# Step 2 — Executing the Docker Command Without Sudo (Optional)
# If you want to avoid typing sudo whenever you run the docker command, add your username to the 
# docker group:
sudo usermod -aG docker ${USER}

# To apply the new group membership, log out of the server and back in, or type the following
su - ${USER}

# Confirm that your user is now added to the docker group by typing
id -nG