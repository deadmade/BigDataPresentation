
{
  description = "Python auto-type thesis and tool development environment";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };
    flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";
      ref = "main";
    };
  };

  outputs = { self, nixpkgs, flake-utils}:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (final: prev: {
              python312 = prev.python312.override {
                packageOverrides = python-final: python-prev: {
                  jaraco-test = python-prev.jaraco-test.overridePythonAttrs (old: {
                    doCheck = false;
                  });
                };
              };
            })
          ];
        };

        # Python environment with dependencies
        pythonEnv = pkgs.python312.withPackages (ps: with ps; [
          zopfli 
          pip
        ]);
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.nodejs_24
            pkgs.git
            pkgs.lazygit
            pythonEnv
            pkgs.mermaid-cli
            pkgs.imagemagick
            pkgs.ripgrep

            pkgs.presenterm
          ];

          shellHook = ''
          '';
        };

        formatter = pkgs.alejandra;
      }
    );
}
