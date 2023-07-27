{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      libreoffice
    ];
  };

  programs = {
    alacritty.settings.font.size = 12;
  };
}
