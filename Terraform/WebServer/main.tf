provider "google" {
  credentials = file("../account.json")
  project     = "mydemoproject-275918"
  region      = "europe-west3"
  zone        = "europe-west3-c"
}

data "google_compute_image" "start_image" {
  family  = "ubuntu-1804-lts"
  project = "ubuntu-os-cloud"
}

resource "google_compute_instance" "myWebServer" {
  name         = "web-server"
  machine_type = "n1-standard-1"
  zone         = "europe-west3-c"
  tags         = ["gitlab", "http-server"]
  boot_disk {
    initialize_params {
      image = data.google_compute_image.start_image.self_link
    }
  }
  metadata = {
    ssh-keys = "daniel_zaharchenk00:${file("~/.ssh/petProj.pub")}"
  }
  metadata_startup_script = "apt update && apt install python2.7 -y"

  network_interface {
    network = "default"
    access_config {
      nat_ip = "34.89.128.46"
    }
  }

  provisioner "file" {
    source      = "Docker"
    destination = "/home/daniel_zaharchenk00/Docker/"
    connection {
      type        = "ssh"
      user        = "daniel_zaharchenk00"
      host        = "34.89.128.46"
      private_key = file("~/.ssh/petProj")
    }
  }
}
