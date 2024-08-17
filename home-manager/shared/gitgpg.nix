{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    enableSshSupport = true;
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
        packedGitLimit = "1024m";
        packedGitWindowSize = "1024m";
        compression = "0";
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
      pack = {
        deltaCacheSize = "2047m";
        packSizeLimit = "2047m";
        workingMemory = "2047m";
      };
      http = {
        postBuffer = "1048576000";
        maxRequestBuffer = "100m";
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
