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
          gst = pkgs.writeShellScriptBin "gst" "exec git status \"$@\"";
          watch-dir = pkgs.writeShellScriptBin "watch-dir" ''
            exec watchexec -c \
              --watch . --watch .git/index --watch .git/HEAD \
              --no-vcs-ignore \
              -i ".git/objects/**" -i ".git/logs/**" \
              -- gst
          '';
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
