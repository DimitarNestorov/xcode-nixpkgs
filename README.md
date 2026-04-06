# Using Xcode with Nix and maintaining it in nixpkgs

## How to add Xcode to Nix store

Yes, it takes a few minutes

```console
$ nix-store --add-fixed --recursive sha256 Xcode.app/
/nix/store/qdj5n50a3p0nh590gjb6xxyk9dmraf61-Xcode.app
```

## How to get the SHA256 hash of `Xcode.app`

### If it's already in Nix store

```console
$ nix-store --query --hash /nix/store/qdj5n50a3p0nh590gjb6xxyk9dmraf61-Xcode.app
sha256:1ch3wv34zs825y9vhains1f4a77a06d6addc2a5r7y5nvdi3ha6h
```

### Without adding it to Nix store

Yes, it takes a few minutes

```console
$ nix-hash --type sha256 Xcode.app/
d0283862dbb6f8938b12ac35659a01ea1c455cd0362ab8932f02e94fc6e603b2
```

## How to convert the hash to SRI format

```console
$ nix-hash --to-sri sha256:1ch3wv34zs825y9vhains1f4a77a06d6addc2a5r7y5nvdi3ha6h
sha256-0Cg4Ytu2+JOLEqw1ZZoB6hxFXNA2KriTLwLpT8bmA7I=
$ nix-hash --to-sri --type sha256 d0283862dbb6f8938b12ac35659a01ea1c455cd0362ab8932f02e94fc6e603b2
sha256-0Cg4Ytu2+JOLEqw1ZZoB6hxFXNA2KriTLwLpT8bmA7I=
```

## How to add a new Xcode entry to nixpkgs

Take the SRI and add it to `pkgs/os-specific/darwin/xcode/default.nix`:

```nix
xcode_26_4 = requireXcode "26.4" "sha256-0Cg4Ytu2+JOLEqw1ZZoB6hxFXNA2KriTLwLpT8bmA7I=";
```

Make sure to reference the new package in `pkgs/top-level/darwin-packages.nix`:

```diff
          inherit (pkgs.callPackages ../os-specific/darwin/xcode { })
            xcode_8_1
            xcode_8_2
            # ...
+           xcode_26_4
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
$ nix build .#xcode_26_4
$ readlink -f result/
/nix/store/qdj5n50a3p0nh590gjb6xxyk9dmraf61-Xcode.app
```

### Build via `default.nix`

```console
$ NIXPKGS_ALLOW_UNFREE=1 nix-build -A xcode_26_4
/nix/store/qdj5n50a3p0nh590gjb6xxyk9dmraf61-Xcode.app
$ readlink -f result/
/nix/store/qdj5n50a3p0nh590gjb6xxyk9dmraf61-Xcode.app
```
