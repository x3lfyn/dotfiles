{ inputs, outputs, lib, config, pkgs, nix-colors, ... }: {
  xdg.desktopEntries = {
    qalc = {
      type = "Application";
      name = "Qalc floating calculator";
      exec = ''alacritty --class qalc -T qalc /home/vobbla16/.nix-profile/bin/qalc'';
    };

    floating-terminal = {
      name = "Floating terminal";
      exec = "alacritty --class floating";
    };

    nvim-foot = {
      name = "Neovim on foot";
      exec = "foot nvim %U";
    };
  };
}
