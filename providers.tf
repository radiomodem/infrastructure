provider "digitalocean" {
  token = "${trimspace(file("./secrets/digitalocean/tkn.enc"))}"
}

provider "cloudflare" {
  email = "${trimspace(file("./secrets/cloudflare/usr.pub"))}"
  token = "${trimspace(file("./secrets/cloudflare/tkn.enc"))}"
}
