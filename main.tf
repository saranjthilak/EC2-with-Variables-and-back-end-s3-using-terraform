terraform {
  

   backend "s3" {
    bucket = "bucket-to-store-state-files"
    key    = "terraform.tfstate"
    region = "us-east-1"
    profile = "default" 
  }
}

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