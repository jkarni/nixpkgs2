{
  pkgs,
  inputs,
  ...
}: let
  zjstatus = inputs.zjstatus.packages.${pkgs.system}.default;
in {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-macchiato";
      pane_frames = false;
      plugins = {
        zjstatus = {
          _props = {
            location = "file:${zjstatus}/bin/zjstatus.wasm";
          };
        };
      };
    };
  };

  xdg.configFile."zellij/layouts/default.kdl".source = ./files/zellij-layout.kdl;
  xdg.configFile."zellij/layouts/default.swap.kdl".source = ./files/zellij-layout.swap.kdl;
}
