{ pkgs, inputs, ... }:
let
  catppuccin-rofi = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "rofi";
    rev = "5350da4";
    sha256 = "sha256-DNorfyl3C4RBclF2KDgwvQQwixpTwSRu7fIvihPN8JY=";
  };
in
{
  home.packages = with pkgs; [
    cider
    slack
    steam
    discord
    dolphin
    spotify
    cliphist
    hyprpaper
    wl-clipboard
    _1password-gui
    signal-desktop
    beekeeper-studio
  ];

  # programs.eww = {
  #   enable = true;
  #   package = pkgs.eww-wayland;
  #   configDir = ./.eww;
  # };

  programs.waybar = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.waybar-hyprland;
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        modules-left = [ "wlr/workspaces" ];
        modules-center = [ ];
        modules-right = [ "pulseaudio" "network" "clock" "tray" "custom/power" ];

        "wlr/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
          format = "{icon}";
          format-icons = { default = ""; };
        };

        pulseaudio = {
          format = " {icon} ";
          format-muted = "󰖁";
          format-icons = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
          tooltip = true;
          tooltip-format = "{volume}%";
        };

        network = {
          interface = "tailscale*";
          format-wifi = " 󰖩 ";
          format-disconnected = " 󰖪 ";
          format-ethernet = " 󰈀 ";
          tooltip = true;
          tooltip-format = "{ifname}: {ipaddr}";
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
          tooltip = true;
          tooltip-format = "{percent}%";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-charging = "";
          format-plugged = "";
          format-icons = [ "" "" "" "" "" "" "" "" "" "" "" "" ];
          tooltip = true;
          tooltip-format = "{capacity}%";
        };

        "custom/power" = {
          tooltip = false;
          on-click = "powermenu";
          format = "襤";
        };

        clock = {
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          format-alt = ''
             {:%d
             %m
            %Y}'';
          format = ''
            {:%H
            %M}'';
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };
      };
    };

    style = builtins.readFile ./.waybar/style.css;
  };

  programs.rofi = {
    enable = true;
    font = "FiraCode Nerd Font 16";
    terminal = "${pkgs.kitty}/bin/kitty";
  };

  programs.kitty = {
    enable = true;
    font.name = "FiraCode Nerd Font";
    font.size = 16;
    theme = "Catppuccin-Macchiato";
  };

  home.file.".config/hypr".recursive = true;
  home.file.".config/hypr".source = ./.hypr;
  home.file.".config/hypr/catppuccin".recursive = true;
  home.file.".config/hypr/catppuccin".source = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "hyprland";
    rev = "99a88fd";
    sha256 = "sha256-07B5QmQmsUKYf38oWU3+2C6KO4JvinuTwmW1Pfk8CT8=";
  };

  home.file.".config/waybar/catppuccin".recursive = true;
  home.file.".config/waybar/catppuccin".source = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "waybar";
    rev = "f74ab1e";
    sha256 = "sha256-WLJMA2X20E5PCPg0ZPtSop0bfmu+pLImP9t8A8V4QK8=";
  };

  home.file.".config/rofi".recursive = true;
  home.file.".config/rofi".source = catppuccin-rofi + "/basic/.config/rofi";
  home.file.".local/share/rofi/themes".recursive = true;
  home.file.".local/share/rofi/themes".source = catppuccin-rofi + "/basic/.local/share/rofi/themes";
}
