# ‘nixos-generate-config’ for Lenovo ThinkPad X1 Carbon
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/6c895ff7-492a-459a-9438-86073078b56d";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/3CBA-F1BE";
      fsType = "vfat";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/9e951fd3-17be-45e3-acf4-b98ef5b11d55"; }];

  networking = {
    useDHCP = lib.mkDefault true;
    hostName = "thinkpadx1";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" ];
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
