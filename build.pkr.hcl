
source "virtualbox-iso" "debian11-x64" {
  boot_command     = [
    "<esc><wait>", 
    "install initrd=/install/initrd.gz ",
    "auto-install/enable=true ",
    "debconf/priority=critical ",
    "debconf/frontend=noninteractive ",
    "preseed/url=http://192.168.178.29:{{ .HTTPPort }}/preseed.cfg <wait>",
    " -- <wait>",
    "<enter><wait>"
  ]
  disk_size        = 4096
  http_content     = {
    "/preseed.cfg" = templatefile("${path.root}/http/deb11-preseed.pkrtpl", var)
  }
  guest_os_type    = "Debian_64"
  iso_checksum     = "sha256:e307d0e583b4a8f7e5b436f8413d4707dd4242b70aea61eb08591dc0378522f3"
  iso_url          = "http://127.0.0.1:1314/netinst.iso"
  shutdown_command = "echo ${var.ssh_user} | sudo -S shutdown -P now"
  ssh_password     = "${var.ssh_pass}"
  ssh_wait_timeout = "20m"
  ssh_username     = "${var.ssh_user}"
  guest_additions_mode = "upload"
  guest_additions_path = "/var/tmp/VBoxGuestAdditions_{{.Version}}.iso"
  vboxmanage       = [
    ["modifyvm", "{{ .Name }}", "--vram", "16"], 
    ["modifyvm", "{{ .Name }}", "--memory", "${var.memory}"]
  ]
}

build {
  sources = ["source.virtualbox-iso.debian11-x64"]
}
