# Impresion (desactivado por defecto)
{ lib, ... }:

{
  services.printing.enable = lib.mkDefault false;
}
