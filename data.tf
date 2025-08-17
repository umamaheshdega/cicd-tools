
data "aws_ami" "ami_info" {

    most_recent = true
    owners = ["973714476881"]

    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice*"]
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


# data "aws_security_group" "sg_id" {
#   id = "sg-0c440c4fb8c91ad1a"
# } 


# data "aws_subnet" "subnet_id" {
#   id = "subnet-05250591bb0daca6a"
# }



