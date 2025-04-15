{ config, ... }:
let
  font = config.stylix.fonts.serif.name;
  fontSize = config.stylix.fonts.sizes.desktop;

  rounding = config.var.theme.rounding;
  border-size = config.var.theme.border-size;

  gaps-out = config.var.theme.gaps-out;

  floating = config.var.theme.bar.floating;
  transparent = config.var.theme.bar.transparent;
  opacity = config.stylix.opacity.desktop;
  position = config.var.theme.bar.position;

  colors = config.lib.stylix.colors.withHashtag;
in
{
  programs.hyprpanel.override = {
    theme = {
      tooltip.scaling = 75;
      bar = {
        inherit transparent floating;
        location = position;
        outer_spacing = "${if floating && transparent then "0" else "8"}px";
        border_radius = "${toString rounding}px";
        opacity = if transparent then 0 else (builtins.floor (opacity * 100));
        dropdownGap = "${toString (gaps-out + (fontSize * 2))}px";

        margin_top = "0px";
        margin_bottom = "0px";
        margin_sides = "${toString gaps-out}px";

        background = colors.base00;

        border = {
          location = "none";
          width = "${toString border-size}px";
          color = colors.base0D;
        };
        buttons = {
          spacing = "0.3em";
          y_margins = "0";
          padding_x = "0.6em";
          padding_y = "0.2em";
          radius = "${toString rounding}px";

          background = colors.base0D;
          hover = colors.base0E;
          icon = colors.base00;
          text = colors.base00;
          media = {
            background = colors.base0D;
            icon = colors.base00;
            text = colors.base00;
          };
          notifications = {
            background = colors.base0B;
            icon = colors.base00;
            text = colors.base00;
          };
          clock = {
            background = colors.base0D;
            icon = colors.base00;
            text = colors.base00;
          };
          battery = {
            background = colors.base0A;
            icon = colors.base00;
            text = colors.base00;
          };
          systray = {
            background = colors.base02;
          };
          bluetooth = {
            background = colors.base0C;
            icon = colors.base00;
            text = colors.base00;
          };
          network = {
            background = colors.base0B;
            icon = colors.base00;
            text = colors.base00;
          };
          volume = {
            background = colors.base09;
            icon = colors.base00;
            text = colors.base00;
          };
          workspaces = {
            background = colors.base02;
            active = colors.base08;
            occupied = colors.base0A;
            available = colors.base0D;
            hover = colors.base0B;
          };
          modules = {
            hyprsunset = {
              background = colors.base0A;
              icon = colors.base00;
              text = colors.base00;
            };
            hypridle = {
              background = colors.base0E;
              icon = colors.base00;
              text = colors.base00;
            };
            power = {
              background = colors.base08;
              icon = colors.base00;
              text = colors.base00;
            };
          };
        };
        menus = {
          card_radius = "${toString rounding}px";

          background = colors.base02;
          text = colors.base05;
          border = {
            radius = "${toString rounding}px";
            size = "${toString border-size}px";
            color = colors.base0D;
          };
          popover = {
            radius = "${toString rounding}px";
            scaling = 75;

            background = colors.base02;
            text = colors.base05;
          };
          tooltip = {
            radius = "${toString rounding}px";
            background = colors.base02;
            text = colors.base05;
          };
          dropdown = {
            background = colors.base02;
            text = colors.base05;
            divider = colors.base04;
          };
          menu = {
            volume = {
              background.color = colors.base00;
              border.color = colors.base09;
              text = colors.base05;
              card.color = colors.base02;
              label.color = colors.base09;
              input_slider = {
                puck = colors.base03;
                backgroundhover = colors.base01;
                background = colors.base03;
                primary = colors.base09;
              };
              audio_slider = {
                puck = colors.base03;
                backgroundhover = colors.base01;
                background = colors.base03;
                primary = colors.base09;
              };
              icons = {
                active = colors.base09;
                passive = colors.base03;
              };
              iconbutton = {
                active = colors.base09;
                passive = colors.base03;
              };
              listitems = {
                active = colors.base09;
                passive = colors.base03;
              };
            };
            notifications = {
              border = colors.base0B;
              background = colors.base00;
              card = colors.base02;
              clear = colors.base08;
              label = colors.base0B;
              no_notifications_label = colors.base03;
              switch_divider = colors.base04;
              switch = {
                puck = colors.base04;
                disabled = colors.base03;
                enabled = colors.base0B;
              };
              scrollbar.color = colors.base0B;
              pager = {
                background = colors.base00;
                button = colors.base0B;
                label = colors.base05;
              };
            };
            clock = {
              background.color = colors.base00;
              border.color = colors.base0D;
              card.color = colors.base02;
              text = colors.base05;
              time = {
                time = colors.base0D;
                timeperiod = colors.base0D;
              };
              calendar = {
                contextdays = colors.base03;
                days = colors.base05;
                currentday = colors.base0D;
                paginator = colors.base0D;
                weekdays = colors.base0D;
                yearmonth = colors.base0E;
              };
            };
            battery = {
              background.color = colors.base00;
              card.color = colors.base02;
              border.color = colors.base0A;
              label = colors.base0A;
              text = colors.base05;
              slider = {
                puck = colors.base03;
                backgroundhover = colors.base01;
                background = colors.base03;
                primary = colors.base0A;
              };
              icons = {
                active = colors.base0A;
                passive = colors.base03;
              };
              listitems = {
                active = colors.base0A;
                passive = colors.base03;
              };
            };
            systray.dropdown = {
              divider = colors.base04;
              text = colors.base05;
              background = colors.base00;
            };
            bluetooth = {
              background.color = colors.base00;
              card.color = colors.base02;
              label.color = colors.base0C;
              border.color = colors.base0C;
              text = colors.base05;
              status = colors.base04;
              switch = {
                puck = colors.base04;
                disabled = colors.base03;
                enabled = colors.base0C;
              };
              switch_divider = colors.base04;
              iconbutton = {
                active = colors.base0C;
                passive = colors.base03;
              };
              icons = {
                active = colors.base0C;
                passive = colors.base03;
              };
              listitems = {
                active = colors.base0C;
                passive = colors.base03;
              };
              scroller.color = colors.base0C;
            };
            network = {
              background.color = colors.base00;
              card.color = colors.base02;
              label.color = colors.base0B;
              border.color = colors.base0B;
              text = colors.base05;
              status.color = colors.base04;
              iconbutton = {
                active = colors.base0B;
                passive = colors.base03;
              };
              icons = {
                active = colors.base0B;
                passive = colors.base03;
              };
              listitems = {
                active = colors.base0B;
                passive = colors.base03;
              };
              switch = {
                enabled = colors.base0B;
                disabled = colors.base03;
                puck = colors.base04;
              };
              scroller.color = colors.base0B;
            };
            media = {
              background.color = colors.base00;
              card = {
                color = colors.base02;
                tint = 50;
              };
              border.color = colors.base0D;
              album = colors.base0D;
              artist = colors.base0C;
              song = colors.base0D;
              buttons = {
                background = colors.base0D;
                text = colors.base00;
                enabled = colors.base0B;
                inactive = colors.base03;
              };
              slider = {
                puck = colors.base03;
                primary = colors.base0D;
                background = colors.base00;
                backgroundhover = colors.base01;
              };
              timestamp = colors.base05;
            };
            power = {
              background.color = colors.base00;
              border.color = colors.base08;
              buttons = {
                shutdown = {
                  background = colors.base02;
                  icon = colors.base00;
                  icon_background = colors.base08;
                  text = colors.base08;
                };
                restart = {
                  background = colors.base02;
                  icon = colors.base00;
                  icon_background = colors.base09;
                  text = colors.base09;
                };
                logout = {
                  background = colors.base02;
                  icon = colors.base00;
                  icon_background = colors.base0B;
                  text = colors.base0B;
                };
                sleep = {
                  background = colors.base02;
                  icon = colors.base00;
                  icon_background = colors.base0C;
                  text = colors.base0C;
                };
              };
            };
            dashboard.powermenu.confirmation = {
              background = colors.base00;
              border = colors.base0D;
              card = colors.base02;
              label = colors.base0D;
              body = colors.base05;
              confirm = colors.base0B;
              deny = colors.base08;
            };
          };
        };
      };
      notification = {
        border_radius = "${toString rounding}px";

        background = colors.base02;
        border = colors.base05;
        text = colors.base05;
        label = colors.base0D;
        close_button = {
          background = colors.base08;
          label = colors.base00;
        };
        time = colors.base04;
        actions = {
          background = colors.base0D;
          text = colors.base00;
        };
      };
      osd = {
        enable = true;
        active_monitor = true;
        duration = 2000;
        location = "bottom";
        orientation = "horizontal";
        margins = "0px 0px ${toString (gaps-out * 3)}px 0px";
        muted_zero = false;
        radius = "${toString rounding}px";
        border.size = "${toString border-size}px";

        label = colors.base0D;
        icon = colors.base00;
        bar_overflow_color = colors.base0B;
        bar_empty_color = colors.base03;
        bar_color = colors.base0D;
        icon_container = colors.base0D;
        bar_container = colors.base01;
        border.color = colors.base0D;
      };
      font = {
        name = font;
        size = "${toString fontSize}";
      };
    };
  };
}
