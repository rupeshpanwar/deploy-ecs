
resource "aws_alb_listener" "ecs_alb_http_listener" {
  load_balancer_arn = aws_alb.ecs_cluster_alb.arn
  port              = 80
  protocol          = "HTTP"
//  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
 // certificate_arn   = aws_acm_certificate.ecs_domain_certificate.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ecs_default_target_group.arn
  }

  depends_on = [aws_alb_target_group.ecs_default_target_group]
}