
data "aws_ami" "ami_info" {

    most_recent = true
    owners = ["439307002497"]

    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}


data "aws_security_group" "sg_id" {
  filter {
    name   = "group-name"
    values = ["my-security-group"]
  }

  filter {
    name   = "vpc-id"
    values = ["vpc-0b54eb72ed77d3dca"]

 

  }
}

data "aws_subnet" "subnet_id" {
    filter {
        name = "Public-subnet"
        Values = ["my-subnet-name"]
    }

    filter {
    name   = "vpc-id"
    values = ["vpc-0b54eb72ed77d3dca"]
    }
}

