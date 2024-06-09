{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  nix-colors,
  ...
}:
{
  programs.firefox = {
    enable = true;
    profiles = {
      vobbla16 = {
        id = 0;

        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
          translate-web-pages
          sidebery
          tokyo-night-v2
        ];

        settings = {
          "general.smoothScroll" = true;
          "general.autoScroll" = true;
          "gfx.webrender.all" = true;

          #          "gfx.x11-egl.force-enabled" = true;
          #          "layers.acceleration.force-enabled" = true;
          "media.av1.enabled" = false;
          #          "media.ffmpeg.vaapi.enabled" = true;
          "media.hardware-video-decoding.force-enabled" = true;
          #          "media.rdd-ffmpeg.enabled" = true;
          #          "widget.dmabuf.force-enabled" = true;
          "media.ffmpeg.vaapi.enabled" = true;
          "widget.use-xdg-desktop-portal" = true;
          "extensions.pocket.enabled" = false;
          "extensions.pocket.onSaveRecs" = false;
          "browser.tabs.closeWindowWithLastTab" = false;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

          "browser.safebrowsing.downloads.remote.block_dangerous" = false;
          "browser.safebrowsing.downloads.remote.block_dangerous_host" = false;
          "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = false;
          "browser.safebrowsing.downloads.remote.block_uncommon" = false;
          "browser.safebrowsing.downloads.remote.url" = false;
          "browser.safebrowsing.downloads.remote.enabled" = false;
          "browser.safebrowsing.downloads.enabled" = false;

          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.healthreport.service.enabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
        };

        userChrome = ''
          #tabbrowser-tabs {
            visibility: collapse !important;
          }

          #titlebar {
            visibility: collapse;
          }

          tab { display: none !important; }

          #sidebar-header {
            visibility: collapse !important;
          }
          	'';
      };
    };
  };
}
