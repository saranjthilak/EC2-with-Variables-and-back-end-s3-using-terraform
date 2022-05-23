

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

