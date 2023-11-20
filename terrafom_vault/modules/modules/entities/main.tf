resource "vault_identity_entity" "entity" {
  name      = var.entity_name
  external_policies = true
  metadata  = var.entity_metadata
}

resource "vault_identity_entity_policies" "policies" {
  policies = var.entity_policies

  exclusive = var.policy_exclusive

  entity_id = vault_identity_entity.entity.id
}


resource "vault_identity_group" "Lords_of_Mando" {
  name     = var.group_name
  type     = "internal"

  external_policies = true

  metadata = {
    version = "2"
  }
}

resource "vault_identity_group_policies" "policies" {
  policies = var.group_policies
  exclusive = true

  group_id = vault_identity_group.Lords_of_Mando.id
}

resource "vault_identity_group_member_entity_ids" "members" {

  exclusive         = true
  member_entity_ids = [vault_identity_entity.entity.id]
  group_id          = vault_identity_group.Lords_of_Mando.id
}