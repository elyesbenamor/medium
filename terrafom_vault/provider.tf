terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.23.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.11.0"
    }
    vault = {
      source = "hashicorp/vault"
      version = "3.23.0"
    }
  }
}
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
provider "vault" {
  alias = "vault"
  address = "http://127.0.0.1:45899"
  token = "hvs.XOkXBaHANh1qu917aPYMdWFV"
  #unseal_token = "yuN4A8rvTTb7mLe9YZ6uwDD0pAoDPEugHAvUzThHRUg="
}
provider "vault" {
  alias = "vault-2"
  address = "http://127.0.0.1:42699"
  token = "hvs.MVcqMb3VPxi8UBYyyM1EMt9d"
  #unseal_token = "TPV+z5m/IRgnR+/9HnbjpUl7KjundqGp31QgsjrtTOM="
}