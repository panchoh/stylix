{ config, lib, ... }:

{
  options.stylix.targets.gnome-text-editor.enable =
    config.lib.stylix.mkEnableTarget "GNOME Text Editor" true;

  config =
    lib.mkIf
      (config.stylix.enable && config.stylix.targets.gnome-text-editor.enable)
      {
      };
}
