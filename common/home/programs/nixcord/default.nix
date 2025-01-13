{ inputs, config, ... }:
{
  imports = [ inputs.nixcord.homeManagerModules.nixcord ];
  programs.nixcord = {
    enable = true;
  };
}
