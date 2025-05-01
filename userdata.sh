sudo yum update -y
sudo yum install -y wget unzip
wget https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_amd64.zip
unzip terraform_1.0.11_linux_amd64.zip
sudo mv terraform /usr/local/bin/
sudo mv terraform /usr/local/bin/
terraform -v
wget https://releases.hashicorp.com/packer/1.7.8/packer_1.7.8_linux_amd64.zip
unzip packer_1.7.8_linux_amd64.zip
sudo mv packer /usr/local/bin/
packer -v