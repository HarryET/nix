{ lib, inputs, nixpkgs, home-manager, user, custom, cfg-location, ... }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{
  thinkpadx1 = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit user custom cfg-location inputs;
      host = {
        hostName = "carbon";
      };
    };
    modules = [
      ./thinkpadx1
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user;
          host = {
            hostName = "carbon";
          };
        };
        home-manager.users.${user} = {
          imports = [ (import ./home.nix) ] ++ [ (import ./thinkpadx1/home.nix) ];
        };
      }
    ];
  };
}
