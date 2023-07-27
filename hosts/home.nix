{ config, lib, pkgs, user, ... }:

{
  imports =
    (import ../modules/programs) ++
    (import ../modules/services);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.05";

    packages = with pkgs; [
      neofetch
      btop

      # Apps
      firefox

      # Communication
      slack
      discord-canary

      # Development
      gh
    ];
  };

  programs = {
    home-manager.enable = true;
  };
}
