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

1. **Just do**

   ```bash
   bash setup_kaggle.bash
   ```
