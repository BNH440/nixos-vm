{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ];

  services.nginx.virtualHosts = {
    "www.blakehaug.com" = {
      useACMEHost = "blakehaug.com";
      forceSSL = true;
      globalRedirect = "blakehaug.com";
    };
    "blakehaug.com" = {
      enableACME = true;
      forceSSL = true;
      root = "/var/www/blakehaug.com";
    };
    "blake.ocf.berkeley.edu" = {
      enableACME = true;
      forceSSL = true;
      globalRedirect = "blakehaug.com";
      redirectCode = 302;
    };
    "ronri.ocf.berkeley.edu" = {
      enableACME = true;
      forceSSL = true;
      globalRedirect = "blakehaug.com";
      redirectCode = 302;
    };
  };

  # Setup tls challenge
  age.secrets.cloudflare-api-key.rekeyFile = ../../../secrets/cloudflare-api-key.age;
  security.acme.certs."blakehaug.com" = {
    dnsProvider = "cloudflare";
    environmentFile = config.age.secrets.cloudflare-api-key.path;
    webroot = null;

    extraDomainNames = [
      "www.blakehaug.com"
    ];
  };

  # Create web files dir
  systemd.tmpfiles.rules = [
    "d /var/www/blakehaug.com 0755 deploy nginx -"
  ];

  # create deploy user for blakehaug.com
  users.users.deploy = {
    isNormalUser = true;
    createHome = true;
    home = "/home/deploy";
    description = "GitHub Actions Deployment User";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP/BzaxAtrueXUriQLlEFaM6c4QF1OKH4teqFVhtOU54 github-actions-deploy"
    ];
  };
}
