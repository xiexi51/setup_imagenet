import json
import os
import shutil

# Load the JSON file with the labels
with open('ILSVRC2012_val_labels.json') as f:
    labels = json.load(f)

# Directory containing the validation images
val_dir = './val'

# Iterate over the labels and move each file to its corresponding category directory
for filename, category in labels.items():
    source_path = os.path.join(val_dir, filename)
    target_dir = os.path.join(val_dir, category)

    # Check if the target directory exists, create if not
    if not os.path.exists(target_dir):
        os.makedirs(target_dir)

    # Move the file
    shutil.move(source_path, target_dir)

print("Files have been moved to their respective category directories.")
