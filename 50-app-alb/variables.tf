variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        project = "expense"
        terraform = true
        environment = "dev"
    }
}


variable "app_alb_tags" {
     default = {
        component = "app_alb"
    }
}

variable "zone_name" {
    default = "devops81.online"
}