resource "digitalocean_ssh_key" "broadcast" {
  name       = "Terraform"
  public_key = "${trimspace(file("./secrets/digitalocean/ssh.pub"))}"
}

resource "digitalocean_droplet" "broadcast" {
  name     = "broadcast.radiomodem.dk"
  image    = "docker"
  region   = "ams2"
  size     = "512mb"
  ssh_keys = ["${digitalocean_ssh_key.broadcast.fingerprint}"]
}

resource "digitalocean_floating_ip" "broadcast" {
  droplet_id = "${digitalocean_droplet.broadcast.id}"
  region     = "${digitalocean_droplet.broadcast.region}"
}

resource "cloudflare_record" "broadcast" {
  domain  = "radiomodem.dk"
  name    = "broadcast"
  value   = "${digitalocean_floating_ip.broadcast.ip_address}"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "broadcast-direct" {
  domain  = "radiomodem.dk"
  name    = "direct.broadcast"
  value   = "${digitalocean_floating_ip.broadcast.ip_address}"
  type    = "A"
  proxied = false
}
