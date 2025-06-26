variable "vpc_id" {
     type = string
     default = "vpc-25de8141"
}
variable "subnet_id" {
     type = string
     default = "subnet-8f37e1a5"
}
variable "security_group_id" {
    type = list
    default = ["sg-3db86e45"]
}
variable "key_name" {
    type = string
    default = "AWS-NONPROD-WILEY"
  
} 

#variable "aws_iam_instance_profile" {
#    type = string
#    default = "aws-nonprod-s3devadmin"  
#}

#ariable "region" {
#    type = string
 #   default = "us-east-1" 
#}

#variable "ami_id" {
#    type = string
 #   default = "ami-0ae4a19822b4ed243"
#}

variable "instance_type" {
    type = string
    default = "t3.medium"
  
}

variable "root_volume_size" {
  type        = number
  default     = 60
}

variable "root_volume_type" {
  type        = string
  default     = "gp3"
}

variable "root_volume_iops" {
  type        = number
  default     = 3000
}

variable "root_volume_throughput" {
  type        = number
  default     = 125
}


variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "ebs_volume_size_xvdb" {
  type    = number
  default = 60
}

variable "ebs_volume_size_xvdc" {
  type    = number
  default = 250
}

variable "ebs_volume_type" {
  type    = string
  default = "gp3"
}

variable "ebs_volume_iops" {
  type    = number
  default = 3000
}

variable "ebs_volume_throughput" {
  type    = number
  default = 125
}

variable "kms_key_id" {
  type    = string
  default = "5ef84e5a-77ff-49fc-8ccc-96d7985b47d9"
}

#variable "app_name" {
 # type    = string
#  default = "SVN"
#}

#variable "group_owner" {
 # type    = string
 # default = "Sean Timmins"
#}

#variable "app_id" {
#  type    = string
 # default = "1956ac77-6ec3-4061-b76c-b99677248665"
#}

#variable "instance_id" {
 # type    = string
#  default = "i-0fc516b80dcf2f476"
#}

#variable "volume_id_xvdb" {
 # type    = string
 # default = "vol-0341ce914a34c3262"
#}

#variable "volume_id_xvdc" {
 # type    = string
 # default = "vol-089b1a11e61070ee3"
#}

variable "common_tags" {
  #description = "Common tags for all AWS resources"
  type = map(string)
  default = {
    infraOwner                    = "stimmins@wiley.com"
    appCode                       = "svn-subversion"
    sysId                         = "1956ac77-6ec3-4061-b76c-b99677248665"
    AppName                       = "SVN"
    appId                         = "1956ac77-6ec3-4061-b76c-b99677248665"
    envName                       = "dev"
   # UpTime                        = "20/05/16 07:30 - 22/12/28 23:30 - EntireWeekends"
    Terraform                     = "True"
    GroupOwner                    = "Sean Timmins"
    functionalArea                = "technology-cloud"
    #missing_tag_notification_date = "2024-09-04T10:31:47Z"
    sysCode                       = "svn-subversion"
    Name                          = "aue1-ldsub-01-new"
  }
}
