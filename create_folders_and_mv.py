import os
import shutil

def process_images(image_directory, total_files):
    # List all files in the image directory
    files = os.listdir(image_directory)

    # Initialize a counter for processed files
    processed_files_count = 0

    # Iterate over the files
    for file in files:
        # Check if the file is a JPEG file
        if file.endswith('.JPEG'):
            # Extract the category ID (assuming it's always after the last underscore in the filename)
            parts = file.split('_')
            category_id = parts[-1].split('.')[0]

            # Create a new filename (removing the category ID part)
            new_filename = '_'.join(parts[:-1]) + '.JPEG'

            # Define the target directory path
            target_dir = os.path.join(image_directory, category_id)

            # Create the target directory if it doesn't exist
            if not os.path.exists(target_dir):
                os.makedirs(target_dir)

            # Move and rename the file to the target directory
            shutil.move(os.path.join(image_directory, file), os.path.join(target_dir, new_filename))

            # Increment the processed files counter
            processed_files_count += 1

            # Display a message every 10000 processed files
            if processed_files_count % 10000 == 0 or processed_files_count == total_files:
                print(f"Processed {processed_files_count} files, total {total_files}.")

# Define the base directory
base_dir = './imagenet-1k/data'

# Process train images
train_dir = os.path.join(base_dir, 'train')
if os.path.exists(train_dir):
    print("Processing train images...")
    process_images(train_dir, 1281167)  # Total number of train images
else:
    print("Train directory does not exist, skipping...")

# Process val images
val_dir = os.path.join(base_dir, 'val')
if os.path.exists(val_dir):
    print("Processing val images...")
    process_images(val_dir, 50000)  # Total number of val images
else:
    print("Val directory does not exist, skipping...")

print("File categorization and renaming complete.")

