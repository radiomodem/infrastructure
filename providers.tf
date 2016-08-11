variable "digitalocean_token" {
  description = "The DigitalOcean authentication token"
}

variable "cloudflare_email" {
  description = "The CloudFlare authentication email"
}

variable "cloudflare_token" {
  description = "The CloudFlare authentication token"
}

provider "digitalocean" {
  token = "${var.digitalocean_token}"
}

provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}
