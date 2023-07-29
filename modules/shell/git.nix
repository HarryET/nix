{ pkgs, custom, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = true;
      };
      user = {
        name = custom.full-name;
        email = custom.email;
      };
      credential.helper = "${pkgs.gh} auth git-credential";
    };
  };
}
