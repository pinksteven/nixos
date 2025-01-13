{ pkgs, ... }:
{
  # Packages needed as dependencies mosetly for scripts
  home.packages = with pkgs; [
    gawk
    coreutils
    gnugrep
    socat
    jq
    python3
  ];

  programs.eww = {
    enable = true;
    enableZshIntegration = true;
    configDir = ./eww-config;
  };
}
