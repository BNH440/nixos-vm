{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./blakehaug.com.nix
    ];

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedTlsSettings = true;
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  security.acme = {
    acceptTerms = true;
    defaults.email = "blake@blakehaug.com";
  };
}
