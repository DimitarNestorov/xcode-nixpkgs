# Using Xcode with Nix and maintaining it in nixpkgs

## How to add Xcode to Nix store

Yes, it takes a few minutes

```console
$ nix-store --add-fixed --recursive sha256 Xcode.app/
/nix/store/9sqnvjrq826nihb0gvd798d75q6gk52z-Xcode.app
```

## How to get the SHA256 hash of `Xcode.app`

Yes, it takes a few minutes

```console
$ nix-hash --type sha256 Xcode.app/
3ec1088ebcf181716a096787b3f6ecbeb971cbc68df3df633217ac73331b3df1
```

## How to convert the hash to SRI format

```console
$ nix-hash --to-sri --type sha256 3ec1088ebcf181716a096787b3f6ecbeb971cbc68df3df633217ac73331b3df1
sha256-PsEIjrzxgXFqCWeHs/bsvrlxy8aN899jMhesczMbPfE=
```

## How to add a new Xcode entry to nixpkgs

Take the SRI and add it to `pkgs/os-specific/darwin/xcode/default.nix`:

```nix
xcode_26_0_1 = requireXcode "26.0.1" "sha256-PsEIjrzxgXFqCWeHs/bsvrlxy8aN899jMhesczMbPfE=";
```

Make sure to reference the new package in `pkgs/top-level/darwin-packages.nix`:

```diff
          inherit (pkgs.callPackages ../os-specific/darwin/xcode { })
            xcode_8_1
            xcode_8_2
            # ...
+           xcode_26_0_1
            xcode
            requireXcode
            ;
```

## Example maintenance PRs

- https://github.com/NixOS/nixpkgs/pull/495808/files
- https://github.com/NixOS/nixpkgs/pull/447107/files
- https://github.com/NixOS/nixpkgs/pull/423732/files
- https://github.com/NixOS/nixpkgs/pull/395740/files
- https://github.com/NixOS/nixpkgs/pull/364482/files

## What can you do in this repo

### Build via `flake.nix`

```console
$ nix build .#xcode_26_3
$ readlink -f result/
/nix/store/x9hdz5mfp44i9b05sswp271jdv68r8vx-Xcode.app
```

### Build via `default.nix`

```console
$ NIXPKGS_ALLOW_UNFREE=1 nix-build -A xcode_26_3
/nix/store/x9hdz5mfp44i9b05sswp271jdv68r8vx-Xcode.app
$ readlink -f result/
/nix/store/x9hdz5mfp44i9b05sswp271jdv68r8vx-Xcode.app
```
