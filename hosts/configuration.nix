{ config, lib, pkgs, inputs, user, custom, ... }:

{
  imports =
    (import ../modules/editors) ++
    (import ../modules/shell);

  users.users.${user} = {
    isNormalUser = true;
    description = custom.full-name;
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "lp" "scanner" ];
    # initialPassword = "changeme!"
    shell = pkgs.zsh;
  };
  security.sudo.wheelNeedsPassword = true; # Security preference

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  console = {
    keyMap = "uk";
  };

  security.rtkit.enable = true;
  security.polkit.enable = true;

  fonts.fonts = with pkgs; [
    jetbrains-mono
    font-awesome
    corefonts
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
      ];
    })
  ];

  environment = {
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "nano";
      VISUAL = "nano";
    };
    systemPackages = with pkgs; [
      nano
      usbutils
      pciutils
    ];
  };

  services = {
    printing = {
      enable = true;
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
    flatpak.enable = true;
    tailscale.enable = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
    };
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  nixpkgs.config.allowUnfree = true;

  system = {
    autoUpgrade = {
      enable = true;
      # channel = "";
    };
    stateVersion = "23.05";
  };
}
