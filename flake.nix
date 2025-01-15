{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    systems.url = "github:nix-systems/default";
    llvm-project = {
      url = "github:llvm/llvm-project";
      flake = false;
    };
  };

  outputs =
    {
      self,
      systems,
      nixpkgs,
      llvm-project,
    }:
    let
      eachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      packages = eachSystem (system: {
        llvm =
          (import nixpkgs {
            inherit system;

            overlays = [
            ];
          }).pkgsLLVM.callPackage
            ./package.nix
            { inherit llvm-project; };
      });
    };
}
