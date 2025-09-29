data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

locals {
  compute = {
    image = {
      vm = {
        basic = data.aws_ami.ubuntu
      }
    }
  }
}
