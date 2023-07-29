{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      libreoffice

      _1password
      _1password-gui
    ];
  };

  programs = {
    alacritty.settings.font.size = 12;
    ssh.extraConfig = ''
Host *
    IdentityAgent ~/.1password/agent.sock
    '';
  };
}
