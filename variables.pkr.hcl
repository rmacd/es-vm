variable "ssh_user" {
  type = string
  default = "demo"
}

variable "ssh_pass" {
  type = string
  default = "12345"
}

variable "kblayout" {
  type = string
  default = "gb"
}

variable "hostname" {
  type = string
  default = "elk-deb11-x64"
}

variable "memory" {
  type = number
  default = 4096
}

variable "locale" {
  type = string
  default = "en_GB"
}
