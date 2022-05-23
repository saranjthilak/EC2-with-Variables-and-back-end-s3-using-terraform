# EC2-with-Variables-and-back-end-s3-using-terraform
A terraform module to set up remote state management with S3 backend for your account. It creates an AWS S3 bucket to store state files.

Steps

1. Creating an EC2 instnace using Terraform 

2. Variables.tf are created and default variables are added.

3. Override Variable using command line

4. After Execution locate and delete statefile.

5. Set S3 backend for storing state file

6. Execute again and confirm state files are stored in S3 Bucket
