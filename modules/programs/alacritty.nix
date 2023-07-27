{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      font = rec {
        normal.family = "JetBrains Mono Nerd Font";
        bold = { style = "bold"; };
      };
    };
  };
}
