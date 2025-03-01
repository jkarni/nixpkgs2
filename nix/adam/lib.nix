{
  inputs,
  cell,
}: let
  inherit (inputs) cells nixos darwin hlsdl put2aria home-manager wsl;

  l = inputs.nixpkgs.lib // builtins;
in {
  mkNixosSystem = {
    name,
    username,
    system ? "x86_64-linux",
    stateVersion ? "23.05",
    nixosModules ? [],
    homeModules ? [],
  }:
    nixos.lib.nixosSystem {
      inherit system;

      pkgs = cell.nixpkgs.default;
      modules =
        [
          wsl.nixosModules.wsl
          hlsdl.nixosModules.default
          put2aria.nixosModules.default
          home-manager.nixosModules.home-manager
          (cell.nixosModules.home homeModules)
          cell.nixosModules.default
          {system.stateVersion = stateVersion;}
        ]
        ++ nixosModules;

      specialArgs = {
        inherit system inputs name username;
        unstable = cell.nixpkgs.unstable;
      };
    };

  mkDarwinSystem = {
    username,
    system ? "aarch64-darwin",
    darwinModules ? [],
    homeModules ? [],
  }:
    darwin.lib.darwinSystem {
      inherit system;

      pkgs = cell.nixpkgs.default;
      modules =
        [
          home-manager.darwinModules.home-manager
          (cell.darwinModules.home homeModules)
          cell.darwinModules.default
        ]
        ++ darwinModules;

      specialArgs = {
        inherit inputs username;
        unstable = cell.nixpkgs.unstable;
      };
    };

  importModules = dir:
    l.mapAttrs'
    (file: type:
      l.nameValuePair
      (l.removeSuffix ".nix" file)
      (import (dir + /${file})))
    (l.filterAttrs
      (file: type: type == "directory" || file != "default.nix")
      (l.readDir dir));
}
