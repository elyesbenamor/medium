variable "entity_name" {
  type = string
  default = ""
}
variable "group_name" {
  type = string
  default = ""
}
variable "entity_metadata" {
  type = map(string)

}

variable "policy_exclusive" {
  type = bool
  default = false
  description = "If true, this resource will take exclusive control of the policies assigned to the entity"
}
variable "entity_policies" {
  type = list(string)
}
variable "group_policies" {
  type = list(string)
}