{ inputs, pkgs, ... }:
let
  secretsPath = builtins.toString inputs.nixos-secrets;
  inherit (inputs.nixos-secrets.hosts.framework) user;
in
{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    defaultSopsFile = "${secretsPath}/secrets.yaml";
    age.keyFile = "/home/${user}/.config/sops/age/keys.txt";
    secrets = {
      "private_keys/github" = {
        path = "/home/${user}/.shh/id_ed25519";
      };
    };
  };

  home.packages = with pkgs; [
    sops
    age
  ];

  systemd.user.services.mbsync.Unit.After = [ "sops-nix.service" ];
  wayland.windowManager.hyprland.settings.exec-once = [ "systemctl --user start sops-nix" ];
}
