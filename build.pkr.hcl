
source "virtualbox-iso" "debian11-x64" {
  boot_command     = [
    "<esc><wait>", 
    "install initrd=/install/initrd.gz ",
    "auto-install/enable=true ",
    "debconf/priority=critical ",
    "debconf/frontend=noninteractive ",
    "preseed/url=http://${var.build_ip}:{{ .HTTPPort }}/preseed.cfg <wait>",
    " -- <wait>",
    "<enter><wait>"
  ]
  disk_size        = 6144
  http_content     = {
    "/preseed.cfg" = templatefile("${path.root}/http/deb11-preseed.pkrtpl", var)
    "/issue_net" = templatefile("${path.root}/http/issue_net.pkrtpl", var)
  }
  guest_os_type    = "Debian_64"
  iso_checksum     = "sha256:e307d0e583b4a8f7e5b436f8413d4707dd4242b70aea61eb08591dc0378522f3"
  iso_url          = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.5.0-amd64-netinst.iso"
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
  vboxmanage_post  = [
    ["modifyvm", "{{ .Name }}", "--nic1", "hostonly", "--hostonlyadapter1", "vboxnet0"],
    ["modifyvm", "{{ .Name }}", "--nic2", "nat"]
  ]
}

build {
  sources = ["source.virtualbox-iso.debian11-x64"]
  provisioner "shell" {
    script           = "install-elk.sh"
    environment_vars = [
      "build_ip=${var.build_ip}"
    ]
  }
}
