{username, ...}: {
  hardware.pulseaudio.enable = false;
  users.users.${username}.extraGroups = ["audio"];
}
