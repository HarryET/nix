{ config, lib, pkgs, ... }:

{
  #imports = [ nurNoPkgs.repos.kira-bruneau.lightdm-webkit2-greeter ];

  programs = {
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
  };

  services.xserver = {
    enable = true;
    layout = "gb";
    xkbVariant = "";
    displayManager = {
      lightdm = {
        enable = true;
        # greeters.webkit2 = {
        #     enable = true;
        #     webkitTheme = fetchTarball {
        #         url = "https://github.com/mshernandez5/WelcomeXP/archive/refs/tags/v0.4.1.tar.gz";
        #         sha256 = "14danik8pyw63mc0jyja79k6znvx2xq4f4239ppvszcz0xhlinax";
        #     };
        # };
      };
      defaultSession = "plasma";
    };
    desktopManager.plasma5 = {
      enable = true;
    };

    # Touchpad
    libinput = {
      enable = true;
      # tapping = true;
    };
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    konsole
    oxygen
    khelpcenter
    elisa
  ];
}
