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
    userName = "Alexey Novikov";
    userEmail = "me@x3lfy.space";
    signing = {
      key = "4F460EBD28EC67D23E72A83FC0711EA1614A6484";
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
