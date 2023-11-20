module "mando_policy" {
  source = "./modules/policies"
  policy_name   = "mando"
  file_name = file("policies/mandalorian.hcl")
}

module "mando_group_policy" {
  source = "./modules/policies"
  policy_name   = "Group_mando"
  file_name = file("policies/mando-group.hcl")
}

module "mando_entity" {
  source = "./modules/entities"
  entity_name = "mando"
  entity_metadata = {
    war = "done"
  }
  policy_exclusive = true
  entity_policies = ["default", module.mando_policy.policy_name]
  depends_on = [ 
    module.mando_policy,
    module.mando_group_policy 
    ]
  group_name = "Lords-of-Mando"
  group_policies = [module.mando_group_policy.policy_name]
}
