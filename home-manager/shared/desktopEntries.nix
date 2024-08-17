{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  xdg.desktopEntries = {
    qalc = {
      type = "Application";
      name = "Qalc floating calculator";
      exec = "foot -a qalc -T qalc ${pkgs.libqalculate}/bin/qalc";
    };

    floating-terminal = {
      name = "Floating terminal";
      exec = "foot -a floating";
    };

    nvim-foot = {
      name = "Neovim on foot";
      exec = "foot nvim %U";
    };
  };
}
