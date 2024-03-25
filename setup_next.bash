pip install timm
pip install setproctitle

{ echo "-----BEGIN OPENSSH PRIVATE KEY-----"; cat ./ssh_azure; } > temp_file && mv temp_file ./ssh_azure

mv ~/.ssh/id_rsa ~/.ssh/___id_rsa
cp ./ssh_azure ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

git config --global credential.helper store
cd ..
git clone git@github.com:harveyp123/HE_transfer_learning.git
cp ./setup_imagenet/locals.py ./HE_transfer_learning
chmod +x ./HE_transfer_learning/run_ddp.bash
cp ./setup_imagenet/ip_list ./HE_transfer_learning