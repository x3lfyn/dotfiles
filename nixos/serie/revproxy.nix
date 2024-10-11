{
  pkgs,
  config,
  ...
}: let
  traefikUid = 1303;
  traefikGid = traefikUid;
  traefikData = "/srv/data/traefik";
in {
  systemd.services."docker-network-proxynet" = {
    serviceConfig.Type = "oneshot";
    wantedBy = [
      "docker-grafana.service"
      "docker-traefik.service"
    ];
    script = let
      net = "proxynet";
    in ''
      ${pkgs.docker}/bin/docker network inspect ${net} > /dev/null 2>&1 || ${pkgs.docker}/bin/docker network create ${net}
    '';
  };

  users.users.traefik = {
    uid = traefikUid;
    isNormalUser = true;
  };
  users.groups.traefik = {gid = traefikGid;};

  systemd.tmpfiles.rules = [
    "d ${traefikData} 0700 ${builtins.toString traefikUid} ${builtins.toString traefikGid} -"
  ];

  virtualisation.oci-containers.containers.traefik = {
    image = "traefik:v3.2";
    user = "${builtins.toString traefikUid}:${builtins.toString config.users.groups.docker.gid}";
    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock"
      "${./traefik.yml}:/etc/traefik/traefik.yml"
      "${traefikData}:/etc/traefik/certs"
    ];
    extraOptions = ["--network=proxynet"];
    ports = ["80:80" "443:443"];
  };
}
