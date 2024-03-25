pip install timm
pip install setproctitle

mkdir -p ~/.ssh
cat ./ssh_azure.pub >> ~/.ssh/authorized_keys
mv ~/.ssh/id_rsa.pub ~/.ssh/___id_rsa.pub
cp ./ssh_azure.pub ~/.ssh/id_rsa.pub
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
mv ~/.ssh/id_rsa ~/.ssh/___id_rsa
{ echo "-----BEGIN OPENSSH PRIVATE KEY-----"; cat ./ssh_azure; } > temp_file && mv temp_file ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

git config --global credential.helper store
cd ..
git clone git@github.com:harveyp123/HE_transfer_learning.git
cp ./setup_imagenet/locals.py ./HE_transfer_learning
cp ./setup_imagenet/ip_list ./HE_transfer_learning

bash ./setup_imagenet/setup_for_a6000.bash