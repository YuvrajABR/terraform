# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}


resource "aws_instance" "web" {
  ami           = ""
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
