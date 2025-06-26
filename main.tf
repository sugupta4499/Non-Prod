terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region         = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "aws-nonprod-terraform-wiley-com"  
    key         = "svn/svn-amazon2023.tfstate"          
    region         = "us-east-1"
   
  }
} 
resource "aws_instance" "replica" {
  ami                    = "ami-0ae4a19822b4ed243" 
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  security_groups             = var.security_group_id
  associate_public_ip_address = false
  iam_instance_profile = "aws-nonprod-s3devadmin"
  key_name        = var.key_name
  
  root_block_device {
   # device_name           = "/dev/xvda"
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = true
  
  }
 
  tags = var.common_tags

}
resource "aws_ebs_volume" "xvdb" {
  availability_zone = var.availability_zone
  size              = var.ebs_volume_size_xvdb
  type              = var.ebs_volume_type
 
  tags = {
    AppName    = "SVN"
    GroupOwner = "Sean Timmins"
    AppID      = "1956ac77-6ec3-4061-b76c-b99677248665"
  }
}

resource "aws_volume_attachment" "attach_xvdb" {
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.xvdb.id
  instance_id = aws_instance.replica.id
}

resource "aws_ebs_volume" "xvdc" {
  availability_zone = var.availability_zone
  size              = var.ebs_volume_size_xvdc
  type              = var.ebs_volume_type
  
  tags = {
   AppName    = "SVN"
    GroupOwner = "Sean Timmins"
    appId      = "1956ac77-6ec3-4061-b76c-b99677248665"
  }
}

resource "aws_volume_attachment" "attach_xvdc" {
  device_name = "/dev/xvdc"
  volume_id   = aws_ebs_volume.xvdc.id
  instance_id = aws_instance.replica.id
}



output "instance_private_ip" {
    value       = aws_instance.replica.private_ip
}

