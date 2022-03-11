//string data type
variable "sample" {
 default = "hello"
}

//number data type
variable "sample1" {
 default = 100
}

//boolean
variable "sample2" {
 default = true
}

//for accessing the variable
output "sample" {
 value = var.sample
}

// combine variable with other strings
output "sample1" {
 value = "${var.sample}, welcome"
}

variable "new-list" {
 default = ["Hello",100]
}

variable "training" {
 default = {
  course = "DevOps"
  time = "6am"
 }
}

output "list1" {
 value = var.new-list[1]
}

output "map1" {
 value = var.training["course"]
}

variable "new1" {}
output "new1" {
 value = var.new1
}