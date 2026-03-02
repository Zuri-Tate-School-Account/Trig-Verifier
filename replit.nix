{ pkgs }: {
  deps = [
    pkgs.python312
    pkgs.cargo
    pkgs.rustc
    pkgs.pkg-config
  ];
}