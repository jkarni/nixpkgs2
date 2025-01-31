{...}: {
  environment.extraInit = ''
    mkdir -p /mnt/c/Users/adame/
    cp ${./wezterm.lua} /mnt/c/Users/adame/.wezterm.lua
  '';
}
