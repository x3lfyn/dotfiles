{pkgs, ...}: let
  secrets = pkgs.callPackage ../../utils/insecureSecret.nix {};

  prometheusUid = 1301;
  prometheusGid = prometheusUid;
  prometheusData = "/srv/data/prometheus";

  grafanaUid = 1302;
  grafanaGid = grafanaUid;
  grafanaData = "/srv/data/grafana";

  config = (pkgs.formats.yaml {}).generate "prometheus.yml" {
    global.scrape_interval = "10s";
    scrape_configs = [
      {
        job_name = "serie";
        static_configs = [
          {
            targets = ["prometheus-node-exporter:9100"];
          }
        ];
      }
      {
        job_name = "linie";
        static_configs = [
          {
            targets = ["10.7.7.20:9100"];
          }
        ];
      }
      {
        job_name = "traefik_metrics";
        static_configs = [
          {
            targets = ["10.7.7.20:12341"];
          }
        ];
        basic_auth = {
          username = secrets.getInsecure "linie-traefik-metrics-user";
          password = secrets.getInsecure "linie-traefik-metrics-passwd";
        };
      }
      {
        job_name = "wg_metrics";
        static_configs = [
          {
            targets = ["10.7.7.20:41568"];
          }
        ];
        basic_auth = {
          username = secrets.getInsecure "linie-wg-metrics-user";
          password = secrets.getInsecure "linie-wg-metrics-passwd";
        };
      }
      {
        job_name = "bb_http";
        metrics_path = "/probe";
        params.module = ["http_2xx" "https_2xx"];
        relabel_configs = [
          {
            source_labels = ["__address__"];
            target_label = "__param_target";
          }
          {
            source_labels = ["__param_target"];
            target_label = "instance";
          }
          {
            replacement = "prometheus-blackbox-exporter:9115";
            target_label = "__address__";
          }
        ];
        static_configs = [
          {
            targets = [
              "misskey.x3lfy.space"
              "wgpanel.x3lfy.space"
              "atuin.x3lfy.space"
              "vaultwarden-w5ktc9rr.x3lfy.space"
              "umami.x3lfy.space"
              "meow.x3lfy.space"
              "meows.x3lfy.space"
              "immich.x3lfy.space"
            ];
          }
        ];
      }
      {
        job_name = "bb_ping";
        metrics_path = "/probe";
        params.module = ["icmp"];
        relabel_configs = [
          {
            source_labels = ["__address__"];
            target_label = "__param_target";
          }
          {
            source_labels = ["__param_target"];
            target_label = "instance";
          }
          {
            replacement = "prometheus-blackbox-exporter:9115";
            target_label = "__address__";
          }
        ];
        static_configs = [
          {
            targets = ["linie.x3lfy.space" "fern.x3lfy.space"];
          }
        ];
      }
    ];
  };
in {
  users.users.prometheus-oci = {
    uid = prometheusUid;
    isNormalUser = true;
  };
  users.groups.prometheus-oci = {gid = prometheusGid;};

  users.users.grafana-oci = {
    uid = grafanaUid;
    isNormalUser = true;
  };
  users.groups.grafana-oci = {gid = grafanaGid;};

  systemd.tmpfiles.rules = [
    "d ${prometheusData} 0700 ${builtins.toString prometheusUid} ${builtins.toString prometheusGid} -"
    "d ${grafanaData} 0700 ${builtins.toString grafanaUid} ${builtins.toString grafanaGid} -"
  ];

  systemd.services."docker-network-prometheus" = {
    serviceConfig.Type = "oneshot";
    wantedBy = [
      "docker-prometheus-oci.service"
      "docker-prometheus-node-exporter.service"
      "docker-prometheus-blackbox-exporter.service"
      "docker-grafana.service"
    ];
    script = let
      net = "prometheus-int";
    in ''
      ${pkgs.docker}/bin/docker network inspect ${net} > /dev/null 2>&1 || ${pkgs.docker}/bin/docker network create ${net}
    '';
  };

  virtualisation.oci-containers.containers.prometheus-oci = {
    image = "prom/prometheus:v2.54.1";
    user = "${builtins.toString prometheusUid}:${builtins.toString prometheusGid}";
    volumes = [
      "${config}:/etc/prometheus/prometheus.yml:ro"
      "${prometheusData}:/prometheus"
    ];
    ports = ["7835:9090"];
    extraOptions = ["--network=prometheus-int"];
  };
  virtualisation.oci-containers.containers.prometheus-node-exporter = {
    image = "prom/node-exporter:v1.8.2";
    volumes = [
      "/proc:/host/proc:ro"
      "/sys:/host/sys:ro"
      "/:/rootfs:ro"
    ];
    cmd = [
      "--path.procfs=/host/proc"
      "--path.rootfs=/rootfs"
      "--path.sysfs=/host/sys"
      "--collector.filesystem.mount-points-exclude=^/(sys|proc|dev|host|etc)($$|/)"
    ];
    extraOptions = ["--network=prometheus-int"];
  };
  virtualisation.oci-containers.containers.prometheus-blackbox-exporter = {
    image = "prom/blackbox-exporter:v0.25.0";
    volumes = [
      "${./blackbox.yaml}:/config/blackbox.yaml:ro"
    ];
    extraOptions = ["--network=prometheus-int"];
  };
  virtualisation.oci-containers.containers.grafana = {
    image = "grafana/grafana:11.2.2";
    user = "${builtins.toString grafanaUid}:${builtins.toString grafanaGid}";
    volumes = [
      "${./blackbox.yaml}:/config/blackbox.yaml:ro"
      "${grafanaData}:/prometheus"
    ];
    extraOptions = ["--network=prometheus-int" "--network=proxynet"];
    ports = ["14562:3000"];
    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.grafana.entrypoints" = "websecure";
      "traefik.http.routers.grafana.rule" = "Host(`grafana.x3lfy.space`)";
      "traefik.http.routers.grafana.tls.certresolver" = "production";
    };
  };
}
