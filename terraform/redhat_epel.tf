
resource "nexus_repository_yum_proxy" "rhel7_epel" {
  name   = "rhel7_epel-yum-proxy"
  online = true

  storage {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy {
    # remote_url       = "http://ftp.uni-bayreuth.de/linux/fedora-epel/7/x86_64/"
    remote_url       = "https://mirror.yer.az/fedora-epel/7/x86_64/"
    content_max_age  = 43200  # 30 Days
    metadata_max_age = 1440
  }

  negative_cache {
    enabled      = true
  }

  http_client {
    blocked    = false
    auto_block = true
  }
}
