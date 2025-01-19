{config, ...}: {
  sops.secrets = {
    "minio/rootCredentialsFile" = {};
  };

  services.minio = {
    enable = true;
    dataDir = ["/mnt/mildred/Rancher/totoro-minio/data"];
    configDir = "/mnt/mildred/Rancher/totoro-minio/config";
    rootCredentialsFile = config.sops.secrets."minio/rootCredentialsFile".path;
  };
}
