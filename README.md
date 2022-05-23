# EC2 with backend S3 for storing remote state files

A terraform module to set up remote state management with S3 backend for your account. It creates an AWS S3 bucket to store state files.

Steps

1. Create an EC2 instnace.

2. Variables.tf to be created and default variables are to be added.

3. Create an S3 bucket to store state files.

4. Override with input Variable using command line if required.

5. After Execution locate and delete statefile.

6. Set S3 backend using the already created S3 bucket for storing state file.

7. Execute again and confirm state files are stored in S3 Bucket.

Usage

# provider block

provider "aws" {
  
  region  = "us-east-1"
  profile = "default"
}

# resourse block for creating backend s3 bucket

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "bucket-to-store-state-files" 
  tags = {
    Name        = "terraform-state-folder"
    Environment = "Development"
  }
}

# resourse block for creating sample ec2 instance


resource "aws_instance" "east1-server" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  
 tags ={
     Name = var.name
 
 }  
}
