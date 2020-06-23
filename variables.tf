variable  "VPC_id" {
    default  = "vpc-2bd92c52"
}

 variable "subnet_id" {
     default = "subnet-bd9afae7"
 }

variable "tag" {
    default = "Jenkins_node"
}

variable "path_to_private_key" {
    default = "junekey"
}
variable "path_to_public_key" {
    default = "junekey.pub"
}
