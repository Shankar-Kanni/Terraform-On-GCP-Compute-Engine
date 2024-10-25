provider "google" {
    project = "terra-55091"
    region = "us-central1" 
}

# resource "google_compute_instance" "vm_instance" {
#     name         = "gcptutorials-vm"
#     machine_type = "e2-small"
#     zone = "us-central1-a"

#     boot_disk {
#     initialize_params {
#         image = "debian-cloud/debian-11"
#     }
#     }    
#     network_interface {       
#     network = "default"
#     access_config {
#     }
#     }
# }

resource "google_monitoring_alert_policy" "alert_policy" {
  display_name = "My Alert Policy"
  combiner     = "OR"
  conditions {
    display_name = "test condition"
    condition_threshold {
      filter     = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
      duration   = "60s"
      comparison = "COMPARISON_GT"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }

  user_labels = {
    foo = "bar"
  }
}