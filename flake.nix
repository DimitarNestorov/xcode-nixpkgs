{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      forEachPlatform = nixpkgs.lib.genAttrs nixpkgs.lib.platforms.unix;
    in
    {
      packages = forEachPlatform (
        platform:
        let
          pkgs = import inputs.nixpkgs {
            system = platform;
            config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [ "Xcode.app" ];
          };
        in
        {
          xcode_26_0_1 = pkgs.darwin.requireXcode "26.0.1" "sha256-PsEIjrzxgXFqCWeHs/bsvrlxy8aN899jMhesczMbPfE=";
          xcode_26_0_1_Apple_silicon = pkgs.darwin.requireXcode "26.0.1_Apple_silicon" "sha256-UBDey19uBljjRw84bY4rzxetFEkHiXLEj39Q578jYL8=";
        }
      );
    };
}
