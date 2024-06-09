{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  nix-colors,
  ...
}:
let
  assocs = {
    #      "image/*" = [ "com.interversehq.qView.desktop" ];
    "x-scheme-handler/file" = [ "re.sonny.Junction.desktop" ];
  };
in
{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = assocs;
    associations.added = assocs;
  };
}
