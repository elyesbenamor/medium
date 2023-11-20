

module "vader_auth" {
  source = "./modules/vault_auth"
  role_name = module.vader_policy.policy_name
  token_policies    = ["default",module.vader_policy.policy_name]
  token_ttl = var.default_lease_ttl_seconds
  token_max_ttl = var.max_lease_ttl_seconds
  type = "approle"
  providers = {
        vault = vault.vault
  }
}