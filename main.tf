module "jenkins" {
  source          = "./modules/ec2"
  ami             = data.aws_ami.ubuntu-linux-2004.id
  key_name        = module.aws_key.export_key_name
  instance_type   = var.instance_type
  tags            = var.tags
  user_data       = file("${path.module}/jenkins.sh")
  security_groups = module.security_group.security_group_name

}

module "aws_key" {
  source   = "./modules/key"
  key_name = "${var.key_name}-${random_id.name.hex}-key"
}

module "security_group" {
  source = "./modules/security"
  tags   = var.tags
  name   = "${var.name}-${random_id.name.hex}-security-group"
}

resource "random_id" "name" {
  byte_length = 4
}

resource "null_resource" "generated_key" {
  provisioner "local-exec" {
    command = <<-EOT
        echo '${module.aws_key.export_private_key}' > ./'${random_id.name.hex}'.pem
        chmod 400 ./'${random_id.name.hex}'.pem
      EOT
  }
}