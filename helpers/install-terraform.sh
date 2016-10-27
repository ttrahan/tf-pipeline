#! /bin/bash

echo -e "\n*** installing Terraform ***"
install_terraform() {
  local FILE_NAME=0.7.7/terraform_0.7.7_linux_amd64.zip
  wget https://releases.hashicorp.com/terraform/$FILE_NAME
  pwd
  unzip $FILE_NAME -d $(pwd)
  export PATH=$PATH:/build
  terraform -v
}
