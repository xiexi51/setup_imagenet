pip install kaggle
mkdir -p ~/.kaggle
cp ./kaggle.json ~/.kaggle/kaggle.json
chmod 600 ~/.kaggle/kaggle.json
kaggle competitions download -c imagenet-object-localization-challenge
unzip imagenet-object-localization-challenge.zip
# wget https://gist.githubusercontent.com/paulgavrikov/3af1efe6f3dff63f47d48b91bb1bca6b/raw/00bad6903b5e4f84c7796b982b72e2e617e5fde1/ILSVRC2012_val_labels.json
python process_kaggle_val.py