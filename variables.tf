variable "region_name"
{
  type = "string"
  default = "europe-west2"
}
variable "subnet_cidr"
{
  type = "string"
  default = "10.10.10.0/24"
}
variable "project_id"
{
  type = "string"
  default = "jupyter-vm-testing"
}
variable "project_name"
{
  type = "string"
  default = "jupyter-vm-testing"
}
##ceate a random id for a service account##
resource "random_string" "service_account_id_random" {
  length = 12
  upper = false
  special = false
}
output "random_id" {
  value = "${random_string.service_account_id_random.result}"
}