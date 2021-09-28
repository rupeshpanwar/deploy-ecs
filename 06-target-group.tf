
resource "aws_alb_target_group" "ecs_default_target_group" {
  name     = "${local.prefix}-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.infrastructure.outputs.vpc_id

   
    tags = merge(
    local.common_tags,
    {
        Name = "${local.prefix}-TG"
    }
  )
}