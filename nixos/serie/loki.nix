{pkgs, ...}: let
  lokiUid = 1304;
  lokiGid = lokiUid;
  lokiData = "/srv/data/loki";
in {
    users.users.loki = {
    uid = lokiUid;
    isNormalUser = true;
    };
    users.groups.loki = {gid = lokiGid;};

    systemd.tmpfiles.rules = [
      "d ${lokiData} 0700 ${builtins.toString lokiUid} ${builtins.toString lokiGid} -"
    ];

    virtualisation.oci-containers.containers.traefik = {
      image = "grafana/loki:3.2.0";
      user = "${builtins.toString lokiUid}:${builtins.toString lokiGid}";
      volumes = [
        "${./loki.yml}:/etc/loki/local-config.yaml"
      ];
      extraOptions = ["--network=prometheus-int"];
      # ports = ["80:80" "443:443"];
    };
}
