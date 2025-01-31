{
  pkgs,
  username,
  ...
}: {
  wsl = {
    enable = true;
    defaultUser = username;
  };
}
