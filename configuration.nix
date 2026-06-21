# Este archivo existe solo por convencion.
# La config real esta en hosts/nixos/default.nix
# y sus modulos en modules/ y home/.
#
# Uso: sudo nixos-rebuild switch --flake .#nixos

{ ... }: {
  imports = [ ./hosts/nixos ];
}
