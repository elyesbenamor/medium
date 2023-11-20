
path "vader/kv/*" {
  capabilities = ["read","create","list","sudo","delete"]
}
path "skywalker/kv/*" {
  capabilities = ["read","create"]
}