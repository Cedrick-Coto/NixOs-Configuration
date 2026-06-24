{ config, pkgs, ... }:

let
  niriConfigBase = builtins.readFile ../../modules/desktop/niri-config.kdl;
in {
  xdg.configFile."niri/config.kdl" = {
    force = true;
    text = niriConfigBase;
  };

  home.activation.ensureNiriUserKdl = config.lib.dag.entryAfter ["writeBoundary"] ''
    if [ ! -f "$HOME/.config/niri/user.kdl" ]; then
      touch "$HOME/.config/niri/user.kdl"
    fi
  '';
}
