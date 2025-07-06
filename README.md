# Smart Auto Compressor

A simple Bash script to:
- Download files from S3
- Compress them into a single ZIP file
- Upload the ZIP back to S3

## Usage
1. Upload files to `s3://smart-compressor-bucket/input/`
2. SSH into your EC2 instance
3. Run:
```bash
bash ~/compress.sh
