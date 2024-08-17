{
  inputs,
  lib,
  config,
  pkgs,
  defaultBrowserDesktop,
  ...
}: let
  assocs =
    lib.genAttrs [
      "text/plain"
      "text/javascript"
      "text/x-python"
      "text/x-haskell"
      "text/python"
      "application/json"
      "text/html"
      "text/markdown"
      "text/x-csrc"
      "application/x-bat"
      "application/xml"
      "text/x-kotlin"
      "text/java"
      "text/php"
      "application/toml"
      "text/rust"
      "text/x-go"
    ] (_: ["dev.zed.Zed.desktop"])
    // lib.genAttrs [
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/about"
      "x-scheme-handler/unknown"
    ] (_: [defaultBrowserDesktop])
    // lib.genAttrs
    [
      "image/bmp"
      "image/gif"
      "image/jpeg"
      "image/jpg"
      "image/pjpeg"
      "image/png"
      "image/tiff"
      "image/x-bmp"
      "image/x-pcx"
      "image/x-png"
      "image/x-portable-anymap"
      "image/x-portable-bitmap"
      "image/x-portable-graymap"
      "image/x-portable-pixmap"
      "image/x-tga"
      "image/x-xbitmap"
      "image/heif"
      "image/avif"
      "image/x-canon-cr2"
    ]
    (_: [
      "imv.desktop"
      "com.interversehq.qView.desktop"
    ]);
in {
  xdg.mimeApps = {
    enable = true;

    defaultApplications = assocs;
    associations.added = assocs;
  };
}
