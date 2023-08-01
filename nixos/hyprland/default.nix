{ pkgs, unstable, ... }:
let
  sddm-catppuccin = pkgs.callPackage ./sddm-catppuccin.nix { };
in
{
  environment.systemPackages = with pkgs; [
    kitty
    # brave
    tmux
    socat
    brightnessctl
    sddm-catppuccin
  ] ++ (with unstable; [
    brave
  ]);

  programs.hyprland = {
    enable = true;
    # nvidiaPatches = true;
    xwayland.enable = true;
  };

  services.xserver.enable = true;
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-macchiato";
  };

  hardware = {
    opengl.enable = true;
    # nvidia.modesetting.enable = true;
  };

  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
  };

}
