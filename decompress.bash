#!/bin/bash

# Define the base directory
BASE_DIR="./imagenet-1k/data"

# Ensure the base directories for train and val exist
mkdir -p "${BASE_DIR}/train"
mkdir -p "${BASE_DIR}/val"

# Loop through the train tar.gz files and decompress them
for i in {0..4}; do
    TAR_FILE="${BASE_DIR}/train_images_${i}.tar.gz"

    # Check if the tar.gz file exists
    if [ -f "${TAR_FILE}" ]; then
        echo "Decompressing ${TAR_FILE} to ${BASE_DIR}/train..."

        # Decompress with pigz and extract with tar, showing the process
        pigz -dc "${TAR_FILE}" | tar -xf - -C "${BASE_DIR}/train"

        # Check if the decompression was successful
        if [ $? -eq 0 ]; then
            echo "Decompression successful, deleting ${TAR_FILE}..."
            rm "${TAR_FILE}"
            echo "${TAR_FILE} deleted."
        else
            echo "An error occurred during the decompression of ${TAR_FILE}."
        fi
    else
        echo "File ${TAR_FILE} not found, skipping..."
    fi
done

# Handle the val tar.gz file
VAL_TAR_FILE="${BASE_DIR}/val_images.tar.gz"

# Check if the val tar.gz file exists
if [ -f "${VAL_TAR_FILE}" ]; then
    echo "Decompressing ${VAL_TAR_FILE} to ${BASE_DIR}/val..."

    # Decompress with pigz and extract with tar, showing the process
    pigz -dc "${VAL_TAR_FILE}" | tar -xf - -C "${BASE_DIR}/val"

    # Check if the decompression was successful
    if [ $? -eq 0 ]; then
        echo "Decompression successful, deleting ${VAL_TAR_FILE}..."
        rm "${VAL_TAR_FILE}"
        echo "${VAL_TAR_FILE} deleted."
    else
        echo "An error occurred during the decompression of ${VAL_TAR_FILE}."
    fi
else
    echo "File ${VAL_TAR_FILE} not found, skipping..."
fi

echo "All done."

