{
  inputs,
  cell,
}: let
  inherit (inputs) cells;
  inherit (cells) themes;
  inherit (cells.home-manager) homeModules;
  inherit (cells.nix-darwin) darwinModules;
in {
  "adam@home" = cell.lib.mkDarwinSystem {
    username = "adam";
    homeModules = with homeModules; [
      mc
      aws
      cli
      iac
      k8s
      charm
      helix
      hlsdl
      ghostty
      raycast
      wezterm
      ide-full
      sops-bin
      syncthing
      (themes.homeModules.catppuccin {flavor = "macchiato";})
    ];
    darwinModules = with darwinModules; [
      fonts
      yabai
      preferences
    ];
  };

  "adam@bridge" = cell.lib.mkDarwinSystem {
    username = "adam";
    homeModules = with homeModules; [
      aws
      cli
      iac
      k8s
      helix
      ghostty
      raycast
      ide-full
      syncthing
      cell.homeModules.bridge
      (themes.homeModules.catppuccin {flavor = "macchiato";})
    ];
    darwinModules = with darwinModules; [
      skhd
      fonts
      yabai
      netskope
      preferences
    ];
  };
}
