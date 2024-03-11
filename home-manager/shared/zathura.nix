{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.zathura = {
    enable = true;
    options = {
      adjust-open = "best-fit";

      pages-per-row = 1;

      scroll-step = 100;
      zoom-min = 10;
      scroll-page-aware = "true";
      smooth-scroll = "true";
      guioptions = "sv";
      selection-clipboard = "clipboard";

      font = "FantasqueSansM Nerd Font 10";

      notification-error-bg = "#1F1F28";
      notification-error-fg = "#FF5D62";
      notification-warning-bg = "#1F1F28";
      notification-warning-fg = "#FFA066";
      notification-bg = "#1F1F28";
      notification-fg = "#DCD7BA";

      completion-bg = "#1F1F28";
      completion-fg = "#C8C093";
      completion-group-bg = "#2A2A37";
      completion-group-fg = "#C8C093";
      completion-highlight-bg = "#957FB8";
      completion-highlight-fg = "#1F1F28";

      index-bg = "#1F1F28";
      index-fg = "#957FB8";
      index-active-bg = "#957FB8";
      index-active-fg = "#1F1F28";

      inputbar-bg = "#1F1F28";
      inputbar-fg = "#C8C093";

      statusbar-bg = "#1F1F28";
      statusbar-fg = "#C8C093";

      highlight-color = "#FFA066";
      highlight-active-color = "#FF5D62";

      default-bg = "#1F1F28";
      default-fg = "#C8C093";
      render-loading = "true";
      render-loading-bg = "#1F1F28";
      render-loading-fg = "#C8C093";

      recolor-lightcolor = "#1F1F28";
      recolor-darkcolor = "#C8C093";
      recolor = "true";
    };
  };
}
