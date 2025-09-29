resource "aws_instance" "myitem_host" {
  count         = 2
  ami           = var._global._data.compute.image.vm.basic.id
  instance_type = var._global._local.compute.vm.basic.instance_type

  tags = {
    Name = "MyItem-Host"
  }
}

locals {
  vm = {
    basic = aws_instance.myitem_host
  }
}
