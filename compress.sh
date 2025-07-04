#!/bin/bash

echo "🔧 Auto File Compressor - Start"

# Define variables
BUCKET="smart-compressor-bucket"
INPUT_DIR="/mnt/data4/input"
OUTPUT_DIR="/mnt/data4/output"
ZIP_NAME="compressed.zip"

echo "✅ Creating input/output directories if not exist..."
mkdir -p $INPUT_DIR $OUTPUT_DIR

echo "📥 Copying new files from S3 bucket to input folder..."
aws s3 cp s3://$BUCKET/input/ $INPUT_DIR/ --recursive

echo "🗜 Compressing files into $ZIP_NAME ..."
cd $INPUT_DIR
zip -r $OUTPUT_DIR/$ZIP_NAME .

echo "☁ Uploading compressed file back to S3..."
aws s3 cp $OUTPUT_DIR/$ZIP_NAME s3://$BUCKET/output/$ZIP_NAME

echo "✅ Done! Compressed file is ready and uploaded to S3: s3://$BUCKET/output/$ZIP_NAME"
#!/bin/bash
# Simple compressor script

INPUT_DIR="/mnt/data4/input"
OUTPUT_DIR="/mnt/data4/output"

for file in "$INPUT_DIR"/*; do
  filename=$(basename "$file")
  gzip -c "$file" > "$OUTPUT_DIR/${filename}.gz"
done

echo "Compression complete!"
