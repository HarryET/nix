{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
    ];
    userSettings = {
      # "terminal.integrated.fontFamily" = "Hack";
    };
  };
}
