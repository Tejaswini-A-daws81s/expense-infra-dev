module "app_alb" {
  source = "terraform-aws-modules/alb/aws"
  internal = true
  name    = "${local.resource_name}-app-alb"
  vpc_id  = local.vpc_id
  subnets = local.private_subnet_ids
  security_groups = [data.aws_ssm_parameter.app_alb_sg_id.value]
  create_security_group = false
  

  tags = merge(
    var.common_tags,
    var.app_alb_tags
  )
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = module.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hello, I am from Application Load Balancer</h1>"
      status_code  = "200"
    }
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"

  zone_name = var.zone_name #daws81s.online
  records = [
    {
      name    = "*.app-${var.environment}"    # *.app-dev anything before app-dev
      type    = "A"
      alias   = {
        name    = module.app_alb.dns_name
        zone_id = module.app_alb.zone_id      # This belongs ALB internal hosted zone, not our zone
      }
      allow_overwrite = true
    }
  ]
}