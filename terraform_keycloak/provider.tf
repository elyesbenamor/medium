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
    keycloak = {
      source = "mrparkers/keycloak"
      version = "4.3.1"
    }
  }
}
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kubernetes-admin@kubernetes"
}
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "keycloak" {
  client_id     = "terraform"
  client_secret = "Om4wsLUlAWDO1jzfTjPJjr3NgAUHMDwi"
  url           = "http://172.30.91.197:8080"
}