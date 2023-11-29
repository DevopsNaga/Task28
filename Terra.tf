provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (replace with your desired AMI)
  instance_type = "t2.micro"
  key_name      = "your-key-pair-name"     # Replace with your EC2 key pair name

  subnet_id = aws_default_subnet.default.id
}

resource "aws_default_vpc" "default" {}

resource "aws_default_subnet" "default" {
  availability_zone = "us-east-1a"  # Change this to your desired availability zone
  vpc_id            = aws_default_vpc.default.id
}
