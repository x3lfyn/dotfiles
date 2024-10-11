{config, ...}: {
  age.secrets = {
    ovpn-ca-crt = {
      file = ../../secrets/ovpn-ca-crt.age;
      owner = "root";
      group = "users";
    };
    ovpn-srv-crt = {
      file = ../../secrets/ovpn-srv-crt.age;
      owner = "root";
      group = "users";
    };
    ovpn-srv-key = {
      file = ../../secrets/ovpn-srv-key.age;
      owner = "root";
      group = "users";
    };
    ovpn-dh = {
      file = ../../secrets/ovpn-dh.age;
      owner = "root";
      group = "users";
    };
  };

  services.openvpn.servers.home = {
    autoStart = true;
    config = ''
      port 13872
      proto udp

      dev tun

      ca ${config.age.secrets.ovpn-ca-crt.path}
      cert ${config.age.secrets.ovpn-srv-crt.path}
      key ${config.age.secrets.ovpn-srv-key.path}
      dh ${config.age.secrets.ovpn-dh.path}

      topology subnet

      server 10.7.7.0 255.255.255.0

      ifconfig-pool-persist /etc/openvpn/ipp.txt

      push "route 192.168.1.0 255.255.255.0"
      route 192.168.1.0 255.255.255.0
      client-to-client

      keepalive 10 120

      user nobody
      group nogroup

      persist-tun
      persist-key

      status /var/log/openvpn-status.log
      log         /var/log/openvpn.log
      log-append  /var/log/openvpn-append.log

      verb 4

      explicit-exit-notify 1

      client-config-dir /etc/openvpn/ccd/
    '';
  };
  environment.etc = {
    "openvpn/ccd/flamme".text = ''
      ifconfig-push 10.7.7.10 255.255.255.0
      iroute 192.168.1.0 255.255.255.0"
    '';
    "openvpn/ccd/linie-ng".text = ''
      ifconfig-push 10.7.7.20 255.255.255.0
    '';
  };
}
