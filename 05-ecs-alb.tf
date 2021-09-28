
resource "aws_alb" "ecs_cluster_alb" {
  name            = "${local.prefix}-ALB"
  internal        = false
  security_groups = [aws_security_group.ecs_alb_security_group.id]
  # subnets         = [split(",", join(",", data.terraform_remote_state.infrastructure.outputs.public_subnets))]
  subnets         = data.terraform_remote_state.infrastructure.outputs.public_subnets

    tags = merge(
    local.common_tags,
    {
        Name = "${local.prefix}-ECS-ALB"
    }
  )

}
