pip install kaggle
mkdir -p ~/.kaggle
cp ./kaggle.json ~/.kaggle/kaggle.json
chmod 600 ~/.kaggle/kaggle.json
kaggle competitions download -c imagenet-object-localization-challenge
echo "unzip..."
unzip -qq imagenet-object-localization-challenge.zip
echo "unzip finish"
python process_kaggle_val.py
# bash setup_next.bash