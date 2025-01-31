{pkgs, ...}: {
  environment.extraInit = ''
    mkdir -p /mnt/c/Users/adame/.config
    cp ${./komorebi.json} /mnt/c/Users/adame/komorebi.json
    cp ${./komorebi.bar.json} /mnt/c/Users/adame/komorebi.bar.json
    cp ${./applications.json} /mnt/c/Users/adame/applications.json
    cp ${./whkdrc} /mnt/c/Users/adame/.config/whkdrc
  '';
}
