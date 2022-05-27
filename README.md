
# Project Title

EC2 with backend S3 for storing remote state files


## Installation

1.Terraform.

2.AWS CLI.

3.Visual Studio Code (Any Text Editor)
    
## Roadmap

1. Create an EC2 instnace.

2. Variables.tf to be created and default variables are to be added.

3. Create an S3 bucket to store state files.

4. Override with input Variable using command line if required.

5. After Execution locate and delete statefile.

6. Set S3 backend using the already created S3 bucket for storing state file.

7. Execute again and confirm state files are stored in S3 Bucket.

## Deployment

To deploy this project run below program in terraform

```terraform
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

#variable.tf

variable "instance_type"{

  type     = string
   default ="t2.micro"
   
}

variable "name"{

   type    = string
   default ="Terraform_Sample_Server"

}

variable "image_id"{

   type    = string
   default ="ami-02e136e904f3da870"

}

```
Overriding with input variables

terraform apply -var="name=my_sample_server"
terraform apply -var="instance_type=my_t2.small"
terraform apply -var="image_id=ami-0022f774911c1d690"


Once Executed delete the state file and create backend S3 with already created S3 bucket

```terraform

terraform {
  

   backend "s3" {
    bucket = "bucket-to-store-state-files"
    key    = "terraform.tfstate"
    region = "us-east-1"
    profile = "default" 
  }
}

```
Check the S3 bucket and confirm remote state file are generated.


