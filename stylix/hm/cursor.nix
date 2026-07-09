{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.stylix.cursor;
in
{
  config =
    lib.mkIf
      (
        config.stylix.enable
        && config.stylix.cursor != null
        && pkgs.stdenv.hostPlatform.isLinux
      )
      {
        home.pointerCursor = {
          inherit (cfg) name package;
          enable =
            config.stylix.targets.xresources.enable
            || config.stylix.targets.gtk.enable
            || config.stylix.targets.sway.enable;
          size = builtins.floor (cfg.size + 0.5);
          x11.enable = config.stylix.targets.xresources.enable;
          gtk.enable = config.stylix.targets.gtk.enable;
          sway.enable = config.stylix.targets.sway.enable;
        };
      };
}
