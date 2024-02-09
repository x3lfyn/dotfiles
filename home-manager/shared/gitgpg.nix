{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "vobbla16";
    userEmail = "novikovprojects@gmail.com";
    signing = {
      key = "F2EE41860B238D993139AF94C1190C108C849FA4";
      signByDefault = true;
    };
    lfs.enable = true;
    aliases = {
      s = "status";
      a = "add";
    };
    extraConfig = {
      core = {
        editor = "nvim";
      };
      color = {
        ui = true;
      };
      push = {
        default = "simple";
      };
      pull = {
        ff = "only";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
