variable "github_pages_ips" {
  default = {
    "0" = "192.30.252.153"
    "1" = "192.30.252.154"
  }
}

resource "cloudflare_record" "radiomodem" {
  count   = "2"
  domain  = "radiomodem.dk"
  name    = "radiomodem.dk"
  value   = "${lookup(var.github_pages_ips, count.index)}"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "www" {
  count   = "2"
  domain  = "radiomodem.dk"
  name    = "www"
  value   = "${lookup(var.github_pages_ips, count.index)}"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "patterns" {
  count   = "2"
  domain  = "radiomodem.dk"
  name    = "patterns"
  value   = "${lookup(var.github_pages_ips, count.index)}"
  type    = "A"
  proxied = true
}
