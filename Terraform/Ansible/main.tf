provider "google" {
  credentials = file("../account.json")
  project     = "mydemoproject-275918"
  region      = "europe-west3"
  zone        = "europe-west3-c"
}
/*resource "google_compute_address" "static" {
  name = "ansible-ip"
}*/

data "google_compute_image" "start_image" {
  family  = "ubuntu-1804-lts"
  project = "ubuntu-os-cloud"
}

resource "google_compute_instance" "myAnsible" {
  name         = "ansible-master"
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
  metadata_startup_script = file("install.sh")
  network_interface {
    network = "default"
    access_config {
      nat_ip = "34.89.221.181"
      #google_compute_address.static.address
    }
  }
  provisioner "file" {
    source      = "~/.ssh/petProj"
    destination = "/home/daniel_zaharchenk00/.ssh/petProj"
    connection {
      type = "ssh"
      user = "daniel_zaharchenk00"
      host = "34.89.221.181"
      #google_compute_address.static.address
      private_key = file("~/.ssh/petProj")
    }
  }
  provisioner "file" {
    source      = "../pass"
    destination = "/home/daniel_zaharchenk00/pass"
    connection {
      type = "ssh"
      user = "daniel_zaharchenk00"
      host = "34.89.221.181"
      #google_compute_address.static.address
      private_key = file("~/.ssh/petProj")
    }
  }
}
