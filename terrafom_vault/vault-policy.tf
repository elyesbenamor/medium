module "vader_policy" {
  source = "./modules/policies"
  policy_name   = "vader"
  file_name = file("policies/lord-vader.hcl")
  providers = {
        vault = vault.vault
  }
}