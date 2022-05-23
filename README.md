# EC2-with-Variables-and-back-end-s3-using-terraform

A terraform module to set up remote state management with S3 backend for your account. It creates an AWS S3 bucket to store state files.

Steps

1. Create an EC2 instnace.

2. Variables.tf to be created and default variables are to be added.

3. Create an S3 bucket to store state files.

4. Override with input Variable using command line if required.

5. After Execution locate and delete statefile.

6. Set S3 backend using the already created S3 bucket for storing state file.

7. Execute again and confirm state files are stored in S3 Bucket.
