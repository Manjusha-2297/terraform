variable "sample" {
 default = "hello"
}

//for accessing the variable
output "sample" {
 value = var.sample
}

// combine variable with other strings
output "sample1" {
 value = "${var.sample}, welcome"
}