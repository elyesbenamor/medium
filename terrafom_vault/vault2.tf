module "vault_2" {

  source = "./modules/helmCharts"
  release_name       = "vault-2"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  release_version    = "0.27.0"
  namespace = "vault-2"
  initiate_namespace = true
  purge_process = true
  set = [
    {
      name  = "ui.enabled"
      value = "true"
    },
    {
      name  = "ui.serviceType"
      value = "NodePort"
    },
    {
      name  = "injector.injector.enabled"
      value = "true"
    },
    {
      name  = "server.dataStorage.storageClass"
      value = "openebs-hostpath"
    },
    {
      name  = "server.dataStorage.size"
      value = "10Gi"
    },
    {
      name  = "server.auditStorage.enabled"
      value = "false"
    },
    {
      name  = "server.auditStorage.enabled"
      value = "true"
    },
    {
      name  = "server.auditStorage.size"
      value = "2Gi"
    },
    {
      name  = "server.auditStorage.storageClass"
      value = "openebs-hostpath"
    }


  ]
  depends_on = [module.openebs]
}
module "transit_policy" {
    providers = {
        vault = vault.vault-2
  }
  source = "./modules/policies"
  policy_name   = "transit"
  file_name = file("policies/transit.hcl")
}

resource "vault_mount" "transit" {
  provider = vault.vault-2
  path                      = "transit"
  type                      = "transit"
  description               = "Example description"
  default_lease_ttl_seconds = 3600
  max_lease_ttl_seconds     = 86400
}

resource "vault_transit_secret_backend_key" "key" {
  backend = vault_mount.transit.path
  name    = "transit"
  provider = vault.vault-2
}