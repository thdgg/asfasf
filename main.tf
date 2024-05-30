module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "ec2" {
  source        = "./modules/ec2_instance"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_id
}

module "autoscaling" {
  source            = "./modules/autoscaling"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = [module.vpc.subnet_id]
  instance_type     = var.instance_type
  ami_id            = var.ami_id
  min_size          = 2
  max_size          = 5
  desired_capacity  = 2
  target_group_arns = [module.load_balancer.target_group_arn]
}

module "load_balancer" {
  source                = "./modules/load_balancer"
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = [module.vpc.subnet_id]
  target_group_port     = 80
  target_group_protocol = "HTTP"
}

module "monitoring" {
  source                 = "./modules/monitoring"
  log_group_name         = "my-log-group"
  metric_alarm_name      = "my-metric-alarm"
  autoscaling_group_name = module.autoscaling.autoscaling_group_name
}