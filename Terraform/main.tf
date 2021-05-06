
provider "google" {
  version = "3.57"
  project = "artful-guru-312707"
  region  = "europe-west4"
  zone    = "europe-west4-a"
}


resource "google_dataproc_cluster" "mycluster" {
  name     = "mycluster"
  region   = "europe-west4"


  cluster_config {
    #staging_bucket = "dataproc-staging-bucket"
    
    master_config {
      num_instances = 1
      machine_type  = "n1-standard-4"
      disk_config {
        boot_disk_size_gb = 30
      }
    }

    worker_config {
      num_instances    = 2
      machine_type     = "n1-standard-4"
      #min_cpu_platform = "Intel Skylake"
      disk_config {
        boot_disk_size_gb = 30
      }
    }

    preemptible_worker_config {
      num_instances = 0
    }

    # Override or set some custom properties
    software_config {
      image_version = "2.0"
      override_properties = {
      }
    }

    }
  }

