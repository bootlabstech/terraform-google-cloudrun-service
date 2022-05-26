variable "cloudrun_name" {
  description = "The name of the cloudrun service"
  type        = string
}
variable "cloudrun_location" {
  description = "The location of the cloudrun service"
  type        = string
}
variable "project" {
  description = "The project of the cloudrun service"
  type        = string
}
variable "cloudrun_image" {
  description = "The image for the cloudrun service"
  type        = string
}
variable "traffic_percent" {
  description = "The traffic for the cloudrun service"
  type        = number 
}
variable "if_latest_revision" {
  description = "Whether to update for the cloudrun service"
  type        = bool
}
