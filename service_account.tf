# Creates new service account for the jupyter vm
resource "google_service_account" "vm_sa" {
  #Uses a random id for the service account
  account_id   = "${random_string.service_account_id_random.result}"
  display_name = "${random_string.service_account_id_random.result}"
  project = "${var.project_id}"
}
resource "google_project_iam_binding" "sa_user_binding" {
    role    = "roles/iam.serviceAccountUser"
     members = [
         "serviceAccount:${google_service_account.vm_sa.email}"
     ]
 }
resource "google_project_iam_binding" "bq_viewer_binding" {
    role    = "roles/bigquery.dataViewer"
     members = [
         "serviceAccount:${google_service_account.vm_sa.email}"
     ]
 }
##################End of service account creation########################

