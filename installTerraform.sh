#! /bin/bash

apt-get update
apt-get install curl unzip

FILE_NAME=terraform_0.7.4_linux_amd64.zip

curl https://releases.hashicorp.com/terraform/0.7.4/$FILE_NAME
unzip $FILE_NAME -d .

terraform apply
