{ inputs, ... }:
let
  secretsPath = builtins.toString inputs.nixos-secrets;
in
{
  sops = {
    defaultSopsFile = "${secretsPath}/secrets.yaml";
    age.keyFile = "/var/lib/sops-nix/keys.txt";

    secrets = {
      "passwords/steven" = {
        neededForUsers = true;
      };
    };
  };
}
