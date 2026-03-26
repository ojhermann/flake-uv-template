{
  description = "{{ description }}";

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
          pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
          gst = import ./packages/gst.nix { inherit pkgs; };
          watch-dir = import ./packages/watch-dir.nix { inherit pkgs gst; };
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.bash
              pkgs.claude-code
              pkgs.deadnix
              pkgs.git
              pkgs.helix
              pkgs.nixfmt
              pkgs.prek
              pkgs.statix
              pkgs.tree
              pkgs.uv
              pkgs.watchexec
              pkgs.zellij
              gst
              watch-dir
            ];
          };
        }
      );
    };
}
