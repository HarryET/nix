{
  description = "Personal System Configuration";

  # Bassed on NixOS 23.05

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = github:nix-community/home-manager/release-23.05;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
    let
      user = "harryet";
      custom = {
        full-name = "Harry Bairstow";
        # avatar = "./media/avatar.png";
        email = "me@harryet.xyz";
      };
      cfg-location = "$HOME/.setup";
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager user custom cfg-location;
        }
      );
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    };
}
