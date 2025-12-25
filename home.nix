{ pkgs, ... }:

{
  imports = [];

  home.packages = [ ];

  # Git config
  programs.git = {
    enable = true;
    settings = {
     	user = {
     	  name = "Blake Haug";
     	  email = "blake@blakehaug.com";
     	};
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedsignersfile = "/home/blakeh/.ssh/allowed_signers";
      user.signingkey = "/home/blakeh/.ssh/id_ed25519.pub";
      init.defaultbranch = "main";
    };
  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.11";
}
