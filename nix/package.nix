{ sourceRoot ? ../., lib, rustPlatform, ... }:
let manifest = lib.importTOML "${sourceRoot}/Cargo.toml";
in rustPlatform.buildRustPackage {
  pname = manifest.package.name;
  version = manifest.package.version;
  cargoLock.lockFile = "${sourceRoot}/Cargo.lock";
  src = lib.cleanSource sourceRoot;
  strictDeps = true;
  meta = {
    inherit (manifest.package) description homepage;
    locense = lib.licenses.asl20;
    platforms = lib.platforms.unix ++ lib.platforms.darwin;
    mainProgram = manifest.package.name;
  };
}
