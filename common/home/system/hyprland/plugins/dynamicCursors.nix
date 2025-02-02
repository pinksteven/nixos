{
  inputs,
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    plugins = [ inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors ];
    settings.plugin.dynamic-cursors = {
      enabled = true;
      mode = "tilt";
      threshold = 1;
      tilt = {
        # controls how powerful the tilt is, the lower, the more power
        # this value controls at which speed (px/s) the full tilt is reached
        limit = 3000;
        # relationship between speed and tilt, supports these values:
        # linear             - a linear function is used
        # quadratic          - a quadratic function is used (most realistic to actual air drag)
        # negative_quadratic - negative version of the quadratic one, feels more aggressive
        function = "negative_quadratic";
      };
      shake = {

        # enables shake to find
        enabled = true;

        # use nearest-neighbour (pixelated) scaling when shaking
        # may look weird when effects are enabled
        nearest = true;

        # controls how soon a shake is detected
        # lower values mean sooner
        threshold = 5.0;

        # magnification level immediately after shake start
        base = 3.0;
        # magnification increase per second when continuing to shake
        speed = 1.5;
        # how much the speed is influenced by the current shake intensity
        influence = 0.0;

        # maximal magnification the cursor can reach
        # values below 1 disable the limit (e.g. 0)
        limit = 10.0;

        # time in milliseconds the cursor will stay magnified after a shake has ended
        timeout = 2000;

        # show cursor behaviour `tilt`, `rotate`, etc. while shaking
        effects = false;
      };
    };
  };
}
