variable "region_name"
{
  type = "string"
  default = "europe-west2"
}
variable "subnet_cidr"
{
  type = "string"
  default = "10.154.0.0/20"
}
variable "project_id"
{
  type = "string"
  default = "gra-jupyter-vm"
}
variable "project_name"
{
  type = "string"
  default = "gra-jupyter-vm"
}
variable "subnet"
{
  type = "string"
  default = "datalab-network"
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