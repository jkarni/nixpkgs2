{pkgs, ...}: {
  imports = [
    ./git.nix
    ./ssh.nix
    ./zellij.nix
    ./zsh.nix
  ];
  home.packages = with pkgs; [
    jq
    enc
    gum
    htop
    wget
    doggo
    unzip
    watch
    cachix
    httpie
    rclone
    hostctl
    neofetch
  ];

  xdg.enable = true;

  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
    };
  };

  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR --mouse";
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  home.shellAliases = {
    cat = "bat";
    nixpkgs = "cd ~/src/github.com/adamgoose/nixpkgs";
  };
}
