resource "keycloak_realm" "vault" {
  realm             = var.realm
  enabled           = true
  display_name      = var.realm
}

resource "keycloak_user" "user" {
  realm_id   = keycloak_realm.vault.id
  username   = var.user_name
  enabled    = true

  email      = format("%s@domain.com",var.user_name)
  first_name = var.user_name

  initial_password {
    value     = var.user_password
    temporary = false
  }
}
resource "keycloak_openid_client" "openid_client" {
  realm_id            = keycloak_realm.vault.id
  client_id           = var.realm

  name                = var.realm
  enabled             = true

  access_type         = "CONFIDENTIAL"
  standard_flow_enabled = true
  valid_redirect_uris = [
    "http://172.30.91.197:8200/*",
    "http://192.168.1.249:32355/*"

  ]

}

resource "keycloak_role" "all_role" {
  realm_id    = keycloak_realm.vault.id
  client_id   = keycloak_openid_client.openid_client.id
  name        = "all"
  description = "manage all paths role"
}

resource "keycloak_openid_user_client_role_protocol_mapper" "user_client_role_mapper" {
     realm_id   = keycloak_realm.vault.id
     client_id  = keycloak_openid_client.openid_client.id
     name       = "user-client-role-mapper"
     claim_name = format("resource_access.%s.roles",  
                  keycloak_openid_client.openid_client.client_id)                                    
     multivalued = true
}