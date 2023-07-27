{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "asdf" ];
      theme = "robbyrussell";
    };

    shellInit = ''
      # TODO: Place extra ZSH config here e.g. Starship
    '';
  };
}
