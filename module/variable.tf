variable "env" {
  description = "this is the environment of the infra"
  type = string
}

variable "bucket_name" {
  description = "this is the bucket name of the infra"
  type = string
}

variable "sg_name" {
  description = "this is the security grouup name of the infra"
  type = string
}

variable "instance_count" {
  description = "this is the count of the infra"
  type = number
}

variable "instance_type" {
  description = "this is the count of the infra"
  type = string
}

variable "ami" {
  description = "this is the ami id of the infra"
  type = string
}

variable "default_storage_size" {
  default = 10
  type = number
}

variable "db_name" {
  description = "this is the db name the infra"
  type = string
}

variable "hash_key" {
  description = "this is the db hash key of the infra"
  type = string
}