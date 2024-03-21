pip install timm
git config --global credential.helper store
cd ..
git clone https://github.com/harveyp123/HE_transfer_learning.git
cp ./setup_imagenet/locals.py ./HE_transfer_learning
chmod +x ./HE_transfer_learning/run_ddp.bash