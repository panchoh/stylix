{
  config,
  lib,
  ...
}:
let
  opacity = lib.toHexString (builtins.ceil (config.stylix.opacity.popups * 255));

  regular = builtins.toString (
    builtins.ceil (config.stylix.fonts.sizes.popups * 1.75)
  );

  large = builtins.toString (
    builtins.ceil (config.stylix.fonts.sizes.popups * 2.5)
  );
in
{
  options.stylix.targets.wayprompt.enable =
    config.lib.stylix.mkEnableTarget "Wayprompt" true;

  config.programs.wayprompt.settings =
    lib.mkIf (config.stylix.enable && config.stylix.targets.wayprompt.enable)
      {
        general = {
          font-regular = "${config.stylix.fonts.sansSerif.name}:size=${regular}";
          font-large = "${config.stylix.fonts.sansSerif.name}:size=${large}";
          pin-square-size = regular;
          pin-square-amount = 32;
        };
        colours = with config.lib.stylix.colors; {
          background = "${base00-hex}${opacity}";
          border = base0D;
          text = base05;
          error-text = base08;
          pin-background = base01;
          pin-border = base0D;
          pin-square = base02;
          ok-button = base0E;
          ok-button-border = base0D;
          ok-button-text = base00;
          not-ok-button = base0D;
          not-ok-button-border = base0D;
          not-ok-button-text = base00;
          cancel-button = base09;
          cancel-button-border = base0D;
          cancel-button-text = base00;
        };
      };
}
