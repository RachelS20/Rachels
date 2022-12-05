variable "administrator_login" {
  description = "Administrator login for PostgreSQL server"
  type        = string
  default = "${POSTGRES_USER}"
}

variable "administrator_password" {
  description = "Administrator password for PostgreSQL server"
  type        = string
  default = "${POSTGRES_PASSWORD}"
  sensitive = true
}