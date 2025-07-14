{ inputs, pkgs, ... }:
let
  secretsPath = builtins.toString inputs.nixos-secrets;
  inherit (inputs.nixos-secrets.hosts.puter) user;
in
{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    defaultSopsFile = "${secretsPath}/secrets.yaml";
    age.keyFile = "/home/${user}/.config/sops/age/keys.txt";
    secrets = {
      "private_keys/ssh" = {
        path = "/home/${user}/.ssh/id_ed25519";
      };
      "private_keys/github" = {
        path = "/home/${user}/.ssh/github";
      };
      "ssh-config" = {
        path = "/home/${user}/.ssh/config";
        mode = "0600";
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
