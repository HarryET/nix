{ config, pkgs, user, ... }:

{
  imports =
    [ (import ./hardware-configuration.nix) ] ++
    [ (import ../../modules/desktop/kde) ] ++ # Window Manager
    [ (import ../../modules/virtualisation/docker.nix) ] ++ # Docker Support
    (import ../../modules/hardware); # Hardware Devices

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  services = {
    fprintd.enable = true;
  };
}
