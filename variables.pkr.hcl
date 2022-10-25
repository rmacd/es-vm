variable "ssh_user" {
  type = string
  default = "vagrant"
}

variable "ssh_pass" {
  type = string
  default = "vagrant"
}

variable "kblayout" {
  type = string
  default = "gb"
}

variable "hostname" {
  type = string
  default = "packer-deb11-x64"
}

variable "memory" {
  type = number
  default = 4096
}

variable "locale" {
  type = string
  default = "en_GB"
}
