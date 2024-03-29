resource "google_compute_instance" "jupytr_vm" {
  depends_on = ["google_service_account.vm_sa"]
  name = "jupytr-instance"
  machine_type = "f1-micro"
  allow_stopping_for_update = true
  tags = ["allow-jupyter1"]
  boot_disk {
    initialize_params {
      image = "jupytr-20190614-1560503468"
    }
  }
  network_interface {
    subnetwork = "${var.subnet}"
    access_config {
     // Include this section to give the VM an external ip address
   }
  }
   service_account {
    email = "${google_service_account.vm_sa.email}"
     #The best practice is to set the full cloud-platform access scope on the instance, then securely limit the service account's access using IAM roles.
    scopes = ["cloud-platform"]
  }
  zone = "europe-west2-b"
}


