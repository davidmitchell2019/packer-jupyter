resource "google_compute_subnetwork" "jupyter-subnet" {
  name                            = "jupyter-subnet"
  ip_cidr_range                   = "${var.subnet_cidr}"
  region                          = "${var.region_name}"
  network                         = "${google_compute_network.vpc_network.self_link}"
  project                         = "${var.project_id}"
  private_ip_google_access        = true
}
resource "google_compute_network" "vpc_network" {
  name                    = "jupytr-network"
  auto_create_subnetworks = "false"
}
resource "google_compute_firewall" "vpc_network_firewall" {
  name    = "jupytr-firewall"
  network = "${google_compute_network.vpc_network.name}"

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22","8888","8889","8887"]
  }
  #opening for testing, would be restricted to the dev machines
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["externalssh"]
}
