resource "aws_ecs_cluster" "fargate-cluster" {
  name = "${local.prefix}-cluster"


  tags = merge(
    local.common_tags,
    {
        Name = "${local.prefix}-ECS-CLUSTER"
    }
  )
}

