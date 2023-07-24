{ inputs, outputs, lib, config, pkgs, nix-colors, ... }: {
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "image/*" = [ "com.interversehq.qView.desktop" ];
      "text/*" = [ "nvim-foot.desktop" ];
      "application/ecmascript" = [ "nvim-foot.desktop" ];
      "application/json" = [ "nvim-foot.desktop" ]; 
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      "application/x-latex" = [ "nvim-foot.desktop" ];
      "application/x-perl" = [ "nvim-foot.desktop" ];
      "application/x-sh" = [ "nvim-foot.desktop" ];
      "application/x-shellscript" = [ "nvim-foot.desktop" ];
      "application/x-tex" = [ "nvim-foot.desktop" ];
      "application/x-texinfo" = [ "nvim-foot.desktop" ];
      "application/xhtml+xml" = [ "nvim-foot.desktop" ];
      "application/xml" = [ "nvim-foot.desktop" ];
      "*yaml" = [ "nvim-foot.desktop" ];
      "*gcode" = [ "nvim-foot.desktop" ];
    };
  };
}
