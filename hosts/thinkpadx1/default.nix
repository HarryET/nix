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
    mullvad-vpn.enable = true;
  };

  programs.git.config = {
    user = {
      signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDsE2lHKw2w+zqjFLS/HrSdY07nOSRyIyG1ApzB6V91P";
    };

    gpg = {
      format = "ssh";
      program = "${pkgs._1password-gui}/share/1password/op-ssh-sign";
    };

    commit = {
      gpgsign = false;
    };
  };
}
