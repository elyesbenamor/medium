variable "vader_secrets" {
  type = map(map(string))

  default = {
    skywalker = {
      connection = "son"
    }
  }
}
variable "skywalker_secrets" {
  type = map(map(string))

  default = {
    leia = {
      connection = "sister"
    },
    vader = {
      connection = "father"
    },
    han_solo = {
      connection = "friend"
    }
  }
}
variable "default_lease_ttl_seconds" {
  type = number
  default = 7800 
  description = "THe token time to live"
}
variable "max_lease_ttl_seconds" {
  type = number
  default = 2638288 
  description = "the max token time to live, how long we can renew the token"
}