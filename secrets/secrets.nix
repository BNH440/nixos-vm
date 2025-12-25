let
  blakeh = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMVCtRg036ANP+l/vmvzj6EJZL2Ic8s5y5tqyMoaOzrs";
  users = [ blakeh ];

  blake-vm = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ46UqcVxkdL8TeUiZBID7Tz3wjVhPw1SstvfH1hjyrR";
  systems = [ blake-vm ];
in
{
  "cloudflare-api-key.age".publicKeys = [ blakeh blake-vm ];
  "armored-secret.age" = {
    publicKeys = [ blakeh ];
    armor = true;
  };
}
