resource "google_compute_instance" "jupytr_vm" {
  depends_on = ["google_service_account.vm_sa"]
  name = "jupytr-instance"
  machine_type = "f1-micro"
  allow_stopping_for_update = true
  tags = ["externalssh"]
  boot_disk {
    initialize_params {
      image = "jupytr-20190613-1560414399"
    }
  }
  network_interface {
    subnetwork = "${google_compute_subnetwork.jupyter-subnet.self_link}"
    access_config {
     // Include this section to give the VM an external ip address
   }
  }
   service_account {
    email = "${google_service_account.vm_sa.email}"
     #The best practice is to set the full cloud-platform access scope on the instance, then securely limit the service account's access using IAM roles.
    scopes = ["cloud-platform"]
  }
  zone = "europe-west2-a"
}


