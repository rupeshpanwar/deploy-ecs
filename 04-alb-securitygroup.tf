resource "aws_security_group" "ecs_alb_security_group" {
  name        = "${local.prefix}-ALB-SG"
  description = "Security group for ECS to communicate in and out"
  vpc_id      = data.terraform_remote_state.infrastructure.outputs.vpc_id

#   ingress {
#     from_port   = 32768
#     protocol    = "TCP"
#     to_port     = 65535
#     cidr_blocks = [var.vpc_cidr]
#   }
  ingress {
    from_port   = 443
    protocol    = "TCP"
    to_port     = 443
    cidr_blocks = [var.internet_cidr_block]
  }

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = [var.internet_cidr_block]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = [var.internet_cidr_block]
  }

    tags = merge(
    local.common_tags,
    {
        Name = "${local.prefix}-ECS-ALB-SG"
    }
  )

}
