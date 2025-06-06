# EC2 with backend S3 for storing remote state files

![image](https://user-images.githubusercontent.com/94320118/170777066-bc06eb4b-d58b-4526-9fd8-0a49ca8386c3.png)

---

## Installation

1. Terraform  
2. AWS CLI  
3. Visual Studio Code (or any text editor)

---

## Roadmap

1. Create an EC2 instance.  
2. Create `variables.tf` and add default variables.  
3. Create an S3 bucket to store state files.  
4. Override variables with input parameters using command line if required.  
5. After execution, locate and delete state file.  
6. Configure S3 backend using the already created S3 bucket to store state files.  
7. Execute Terraform again and confirm state files are stored in the S3 bucket.

---

## Deployment

To deploy this project, use the following Terraform code snippets:

```terraform
# Provider block

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# Resource block for creating backend S3 bucket

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "bucket-to-store-state-files" 
  tags = {
    Name        = "terraform-state-folder"
    Environment = "Development"
  }
}

# Resource block for creating sample EC2 instance

resource "aws_instance" "east1-server" {
  ami           = var.image_id
  instance_type = var.instance_type

  tags = {
    Name = var.name
  }
}

# variables.tf

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "name" {
  type    = string
  default = "Terraform_Sample_Server"
}

variable "image_id" {
  type    = string
  default = "ami-02e136e904f3da870"
}
