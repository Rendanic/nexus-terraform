resource "nexus_repository_yum_group" "ol7os" {
  name   = "ol7os-yum-group"
  online = true

  group {
    member_names = [
      nexus_repository_yum_proxy.ol7_latest.name,
      nexus_repository_yum_proxy.ol7_uekr6.name,
    ]
  }

  storage {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }
}

resource "nexus_repository_yum_proxy" "ol7_latest" {
  name   = "ol7_latest-yum-proxy"
  online = true

  storage {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy {
    remote_url       = "https://yum.oracle.com/repo/OracleLinux/OL7/latest/x86_64/"
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

resource "nexus_repository_yum_proxy" "ol7_uekr6" {
  name   = "ol7_uekr6-yum-proxy"
  online = true

  storage {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy {
    remote_url       = "https://yum.oracle.com/repo/OracleLinux/OL7/UEKR6/x86_64/"
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
