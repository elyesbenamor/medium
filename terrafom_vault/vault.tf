
module "vault" {

  source = "./modules/helmCharts"
  release_name       = "vault"
  values = [ "${file("./policies/values.yaml")}" ]
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  release_version    = "0.27.0"
  namespace = "vault"
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
    }
    
  ]
  depends_on = [module.openebs]
}

module "vader_vault_secrets" {
  source = "./modules/vault"
  path   = "vader"
  secrets = var.vader_secrets
  providers = {
        vault = vault.vault
  }
  
}
module "skywalker_vault_secrets" {
  source = "./modules/vault"
  path   = "skywalker"
  secrets = var.skywalker_secrets
  providers = {
        vault = vault.vault
  }
}