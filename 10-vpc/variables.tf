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

variable "public_cidrs" {
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cidrs" {
    default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "database_cidrs" {
    default = ["10.0.21.0/24", "10.0.22.0/24"]
}

variable "is_peering_required" {
    type = bool
    default = true
}

