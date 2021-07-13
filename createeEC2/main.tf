# adding accesskey and accessid to local environment
#
# export AWS_ACCESS_ID = ""
# export AWS-ACCESS_KEY = ""


provider "aws"{
    region = "us-east-1"
    version = "3.10.0"
}

provider "aws"{
    region = "us-east-2"
    version = "3.10.0"
    alias = "us-east-2"
}

variable "eastus-1-zone" {
    type = list
    default = ["us-east-1a","us-east-1b"]
}


variable "eastus-2-zone" {
    type = list
    default = ["us-east-2a","us-east-2b"]
}

resource "aws_instance" "frontend-ec-east-1" {
    count = 2
    ami = ""
    depends_on = [aws_instance.backend-ec-east-1]
    instance_type = "t2.micro"
    availability_zone = var.eastus-2-zone[count.index]
    tags = {
        Name = "web-frontend-server-${count.index}"
    }
}

resource "aws_instance" "backend-ec-east-1" {
    count = 2
    ami = ""
    instance_type = "t2.micro"
    availability_zone = var.eastus-2-zone[count.index]
    tags = {
        Name = "web-backend-server-${count.index}"
    }
}

resource "aws_instance" "frontend-ec-east-2" {
    count = 2
    ami = ""
    instance_type = "t2.micro"
    availability_zone = var.eastus-2-zone[count.index]
    depends_on = [aws_instance.backend-ec-east-2]
    tags = {
        Name = "web-frontrend-server-${count.index}"
    }
    provider = aws.us-east-2
}


resource "aws_instance" "backend-ec-east-2" {
    count = 2
    ami = ""
    instance_type = "t2.micro"
    availability_zone = var.eastus-2-zone[count.index]
    tags = {
        Name = "web-backend-server-${count.index}"
    }
    provider = aws.us-east-2
}
