listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = true
}

storage "file" {
  path = "tmpfs"
}

license_path = "/etc/vault.d/.vault-license"
disable_mlock = true
log_level = "debug"
ui = true
