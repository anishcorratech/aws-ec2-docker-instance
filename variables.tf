variable "name" {
  default = "demo"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t3.small"
}

variable "key_name" {
  default = "demo"
}

variable "sg_name" {
  default = "demo"
}

variable "vpc_id" {
  default = "vpc-a11ec6dc"
}

variable "subnet_id" {
  default = "subnet-d3f833b5"
}

variable "tags" {
  type = map(string)
  default = {
    "Created" = "Anish"
    "Managed" = "IAC"
  }
}

variable "sg_tags" {
  default = {
    "description" = "security group rules"
  }
}

variable "user_data" {
  type    = string
  default = "user_data.sh"
}

variable "sg_rules" {
  default = [
    {
      type        = "ingress"
      description = "Allows SSH access from anywhere"
      from_port   = "22"
      to_port     = "22"
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      type        = "ingress"
      description = "Allows HTTP access from anywhere"
      from_port   = "80"
      to_port     = "80"
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      type        = "egress"
      description = "Allow all access"
      from_port   = "-1"
      to_port     = "-1"
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "root_block_device" {
  type = list(any)
  default = [
    {
      encrypted   = false
      volume_type = "gp3"
      throughput  = 200
      volume_size = 50
    },
  ]
}
