variable "path" {
  type        = string
  description = "Vault KV path"
}
variable "data_json" {
  type        = map(string)
  description = "Map of data for each secret"
  default     = {}
}
variable "secrets" {
  type        = map(map(string))
  description = "Map of secrets with their data"
}
