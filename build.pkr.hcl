
source "virtualbox-iso" "debian11-x64" {
  boot_command     = [
    "<esc><wait>", 
    "install noapic ", 
    "hw-detect/start_pcmcia=false ", 
    "hostname=${var.hostname} ", 
    "fb=false debconf/frontend=noninteractive ", 
    "keyboard-configuration/modelcode=SKIP keyboard-configuration/layout=${var.kblayout} ", 
    "keyboard-configuration/variant=${var.kblayout} console-setup/ask_detect=false ", 
    "initrd=/install/initrd.gz -- <enter>"
  ]
  disk_size        = 4096
  guest_os_type    = "Debian_64"
  iso_checksum     = "sha256:e307d0e583b4a8f7e5b436f8413d4707dd4242b70aea61eb08591dc0378522f3"
  iso_url          = "http://127.0.0.1:1314/netinst.iso"
  shutdown_command = "echo var.ssh_name | sudo -S shutdown -P now"
  ssh_password     = "${var.ssh_pass}"
  ssh_timeout      = "30m"
  ssh_username     = "${var.ssh_name}"
  vboxmanage       = [
    ["modifyvm", "{{ .Name }}", "--vram", "${var.vram}"], 
    ["modifyvm", "{{ .Name }}", "--memory", "${var.memory}"]
  ]
}

build {
  sources = ["source.virtualbox-iso.debian11-x64"]
}