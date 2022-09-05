terraform {
  required_providers {
    nexus = {
      source = "datadrivers/nexus"
      version = "1.21.0"
    }
  }
}

provider "nexus" {
  insecure = true
  password = "admin"
  url      = "http://nexus-192-168-56-12.nip.io:8081"
  username = "admin"
}
