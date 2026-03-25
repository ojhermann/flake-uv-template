{
  description = "A copier template for Nix flake + uv Python projects";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.deadnix
              pkgs.helix
              pkgs.nixfmt
              pkgs.prek
              pkgs.statix
              pkgs.uv
              pkgs.watchexec
              pkgs.zellij
            ];
          };
        }
      );
    };
}
