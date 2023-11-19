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
