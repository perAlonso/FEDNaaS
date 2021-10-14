resource "openstack_compute_instance_v2" "test" {
  name            = "test-vm"
  image_name      = "Ubuntu 18.04"
  flavor_name     = "ssc.xsmall"
  key_pair        = "lab01"
  security_groups = ["Pontus Ernstedt"]

  network {
    name          = "UPPMAX 2021/1-5 Internal IPv4 Network"
  }

  user_data = <<-EOF
    #cloud-config

    apt:
      sources:
        docker.list:
          source: deb [arch=amd64] https://download.docker.com/linux/ubuntu $RELEASE stable
          keyid: 9DC858229FC7DD38854AE2D88D81803C0EBFCD88

    apt_update: true
    apt_upgrade: true
    packages:
    - cowsay
    - python-pip
    - python-dev
    - build-essential
    - cowsay
    - docker-ce
    - docker-ce-cli
    - docker-compose
    byobu_default: system

    runcmd:
    - sudo git clone https://github.com/scaleoutsystems/fedn.git
    - cd fedn
    - cd config
    - mv settings-combiner.yaml.template settings-combiner.yaml
    - mv settings-reducer.yaml.template settings-reducer.yaml
    - cd ..
    - docker network create fedn_default
    - docker-compose -f config/base-services.yaml -f config/private-network.yaml up -d
    - docker-compose -f config/reducer.yaml -f config/private-network.yaml up -d
    - docker-compose -f config/combiner.yaml -f config/private-network.yaml up -d
  EOF

}

resource "openstack_networking_floatingip_v2" "fip_1" {
  pool = "Public External IPv4 Network"
}

resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.fip_1.address}"
  instance_id = "${openstack_compute_instance_v2.test.id}"
}

