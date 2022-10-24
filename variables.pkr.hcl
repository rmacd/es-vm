variable "ssh_name" {
  type = string
  default = "packer"
}

variable "ssh_pass" {
  type = string
  default = "packer"
  sensitive = true
}

variable "kblayout" {
  type = string
  default = "GB"
}

variable "hostname" {
  type = string
  default = "packer-deb11-x64"
}

variable "vram" {
  type = number
  default = 4
}

variable "memory" {
  type = number
  default = 4096
}
