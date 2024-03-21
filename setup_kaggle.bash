pip install kaggle
mkdir -p ~/.kaggle
cp ./kaggle.json ~/.kaggle/kaggle.json
chmod 600 ~/.kaggle/kaggle.json
kaggle competitions download -c imagenet-object-localization-challenge
unzip imagenet-object-localization-challenge.zip > /dev/null 2>&1
python process_kaggle_val.py