
locals {
  computed_path = var.path == "kv" ? "kv" : "${var.path}/kv"
}

resource "vault_mount" "kvv2" {
  path        = local.computed_path
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
  lifecycle {
    prevent_destroy = true 
  }
}


resource "vault_kv_secret_v2" "secret" {
  for_each = { for secret, data in var.secrets : secret => data }
  mount                      = vault_mount.kvv2.path
  name                       = each.key
  cas                        = 1
  delete_all_versions        = true
  data_json                  = jsonencode(each.value)
  lifecycle {
    prevent_destroy = true 
  }
}
