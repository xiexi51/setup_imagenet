# Set Up ImageNet Dataset

This guide provides step-by-step instructions to set up the ImageNet dataset for your machine learning projects using two different sources: Hugging Face and Kaggle.

## Method 1: Download from Hugging Face

1. **Clone the ImageNet Dataset Repository**

   Use the following `git` command to clone the ImageNet dataset. You will be prompted to enter a password; use your Hugging Face access token as the password.

   ```bash
   git clone https://HUGGINGFACE_ACCESS_TOKEN@huggingface.co/datasets/imagenet-1k
   ```

   Replace `HUGGINGFACE_ACCESS_TOKEN` with your actual Hugging Face access token.

2. **Install `pigz`**

   ```bash
   sudo apt-get install pigz
   ```

3. **Decompress the Dataset**

   ```bash
   bash ./decompress.bash
   ```

4. **Organize Dataset Files**

   Execute the Python script to create necessary folders and move the dataset files into their respective categories.

   ```bash
   python create_folders_and_mv.py
   ```

## Method 2: Download from Kaggle

Follow the detailed guide on [Using the ImageNet Dataset with PyTorch](https://towardsdatascience.com/downloading-and-using-the-imagenet-dataset-with-pytorch-f0908437c4be).

### Steps:

1. **Install Kaggle API**

   ```bash
   pip install kaggle
   ```

2. **Set Up Kaggle API Token**

   Place your `kaggle.json` API token in the `~/.kaggle/` directory.

   ```bash
   mkdir ~/.kaggle
   cp path/to/kaggle.json ~/.kaggle/kaggle.json
   chmod 600 ~/.kaggle/kaggle.json
   ```

3. **Download the ImageNet Dataset**

   ```bash
   kaggle competitions download -c imagenet-object-localization-challenge
   ```

4. **Unzip the Dataset**

   ```bash
   unzip imagenet-object-localization-challenge.zip
   ```

5. **Download `ILSVRC2012_val_labels.json` and Process Validation Images**

   Download the validation labels and run the provided Python script to categorize the validation images.

   ```bash
   wget https://gist.githubusercontent.com/paulgavrikov/3af1efe6f3dff63f47d48b91bb1bca6b/raw/00bad6903b5e4f84c7796b982b72e2e617e5fde1/ILSVRC2012_val_labels.json
   python process_kaggle_val.py
   ```
