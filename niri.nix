{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.niri = {
    enable = true;

    settings = {
      screenshot-path = "~/Screenshots/%Y-%m-%d %H-%M-%S.png";
      spawn-at-startup = "noctalia";
      prefer-no-csd = {};
      hotkey-overlay.skip-at-startup = {};

      input = {
        keyboard = {
          xkb = {
            layout = "br";
            variant = "abnt2";
            options = "ctrl:swapcaps";
          };
          numlock = {};
        };

        touchpad = {
          tap = {};
          natural-scroll = {};
        };
      };

      layout = {
        preset-column-widths._children = [
          {proportion = 0.33333;}
          {proportion = 0.5;}
          {proportion = 0.66667;}
        ];
        default-column-width = {
          proportion = 0.5;
        };
        gaps = 8;
        always-center-single-column = {};

        focus-ring = {
          width = 2;
          active-color = "#FFFFFF";
          inactive-color = "#505050";
        };
      };

      _children = [
        {
          layer-rule._children = [
            {
              match._props = {
                namespace = "^noctalia-backdrop";
              };
            }
            {place-within-backdrop = true;}
          ];
        }
        {
          window-rule._children = [
            {geometry-corner-radius = 12;}
            {clip-to-geometry = true;}
          ];
        }
      ];

      switch-events.lid-close = {
        spawn = [
          "noctalia"
          "msg"
          "session"
          "lock-and-suspend"
        ];
      };

      binds = {
        "Mod+Space" = {
          spawn-sh = "noctalia msg panel-toggle launcher";
        };
        "Mod+I" = {
          spawn-sh = "noctalia msg settings-toggle";
        };
        "Mod+S" = {
          spawn-sh = "noctalia msg panel-toggle control-center";
        };
        "Mod+Return" = {
          spawn = "kitty";
        };
        "Mod+O" = {
          _props.repeat = false;
          toggle-overview = {};
        };
        "Mod+Q" = {
          _props.repeat = false;
          close-window = {};
        };
        "Mod+Shift+Slash".show-hotkey-overlay = {};
        "XF86AudioRaiseVolume" = {
          _props.allow-when-locked = true;
          spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
        };
        "XF86AudioLowerVolume" = {
          _props.allow-when-locked = true;
          spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
        };
        "XF86AudioMute" = {
          _props.allow-when-locked = true;
          spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
        "XF86AudioMicMute" = {
          _props.allow-when-locked = true;
          spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        };
        "XF86AudioPlay" = {
          _props.allow-when-locked = true;
          spawn-sh = "playerctl play-pause";
        };
        "XF86AudioStop" = {
          _props.allow-when-locked = true;
          spawn-sh = "playerctl stop";
        };
        "XF86AudioPrev" = {
          _props.allow-when-locked = true;
          spawn-sh = "playerctl previous";
        };
        "XF86AudioNext" = {
          _props.allow-when-locked = true;
          spawn-sh = "playerctl next";
        };
        "XF86MonBrightnessUp" = {
          _props.allow-when-locked = true;
          spawn-sh = "noctalia msg brightness-up";
        };
        "XF86MonBrightnessDown" = {
          _props.allow-when-locked = true;
          spawn-sh = "noctalia msg brightness-down";
        };

        "Mod+H".focus-column-left = {};
        "Mod+L".focus-column-right = {};
        "Mod+J".focus-window-or-workspace-down = {};
        "Mod+K".focus-window-or-workspace-up = {};
        "Mod+Ctrl+Left".move-column-left = {};
        "Mod+Ctrl+Down".move-window-down = {};
        "Mod+Ctrl+Up".move-window-up = {};
        "Mod+Ctrl+Right".move-column-right = {};
        "Mod+Ctrl+H".move-column-left = {};
        "Mod+Ctrl+J".move-window-down-or-to-workspace-down = {};
        "Mod+Ctrl+K".move-window-up-or-to-workspace-up = {};
        "Mod+Ctrl+L".move-column-right = {};

        "Mod+Home".focus-column-first = {};
        "Mod+End".focus-column-last = {};
        "Mod+Ctrl+Home".move-column-to-first = {};
        "Mod+Ctrl+End".move-column-to-last = {};
        "Mod+Shift+Left".focus-monitor-left = {};
        "Mod+Shift+Down".focus-monitor-down = {};
        "Mod+Shift+Up".focus-monitor-up = {};
        "Mod+Shift+Right".focus-monitor-right = {};
        "Mod+Shift+H".focus-monitor-left = {};
        "Mod+Shift+J".focus-monitor-down = {};
        "Mod+Shift+K".focus-monitor-up = {};
        "Mod+Shift+L".focus-monitor-right = {};
        "Mod+Shift+Ctrl+Left".move-column-to-monitor-left = {};
        "Mod+Shift+Ctrl+Down".move-column-to-monitor-down = {};
        "Mod+Shift+Ctrl+Up".move-column-to-monitor-up = {};
        "Mod+Shift+Ctrl+Right".move-column-to-monitor-right = {};
        "Mod+Shift+Ctrl+H".move-column-to-monitor-left = {};
        "Mod+Shift+Ctrl+J".move-column-to-monitor-down = {};
        "Mod+Shift+Ctrl+K".move-column-to-monitor-up = {};
        "Mod+Shift+Ctrl+L".move-column-to-monitor-right = {};

        "Mod+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          focus-workspace-down = {};
        };
        "Mod+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          focus-workspace-up = {};
        };
        "Mod+Ctrl+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          move-column-to-workspace-down = {};
        };
        "Mod+Ctrl+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          move-column-to-workspace-up = {};
        };

        "Mod+WheelScrollRight".focus-column-right = {};
        "Mod+WheelScrollLeft".focus-column-left = {};
        "Mod+Ctrl+WheelScrollRight".move-column-right = {};
        "Mod+Ctrl+WheelScrollLeft".move-column-left = {};

        "Mod+1".focus-workspace = 1;
        "Mod+2".focus-workspace = 2;
        "Mod+3".focus-workspace = 3;
        "Mod+4".focus-workspace = 4;
        "Mod+5".focus-workspace = 5;
        "Mod+6".focus-workspace = 6;
        "Mod+7".focus-workspace = 7;
        "Mod+8".focus-workspace = 8;
        "Mod+9".focus-workspace = 9;
        "Mod+Ctrl+1".move-column-to-workspace = 1;
        "Mod+Ctrl+2".move-column-to-workspace = 2;
        "Mod+Ctrl+3".move-column-to-workspace = 3;
        "Mod+Ctrl+4".move-column-to-workspace = 4;
        "Mod+Ctrl+5".move-column-to-workspace = 5;
        "Mod+Ctrl+6".move-column-to-workspace = 6;
        "Mod+Ctrl+7".move-column-to-workspace = 7;
        "Mod+Ctrl+8".move-column-to-workspace = 8;
        "Mod+Ctrl+9".move-column-to-workspace = 9;

        "Mod+BracketLeft".consume-or-expel-window-left = {};
        "Mod+BracketRight".consume-or-expel-window-right = {};

        # Consume one window from the right to the bottom of the focused column.
        "Mod+Comma".consume-window-into-column = {};
        # Expel the bottom window from the focused column to the right.
        "Mod+Period".expel-window-from-column = {};

        # Cycle through widths set in preset-column-widths.
        "Mod+R".switch-preset-column-width = {};
        # Cycling through the presets in reverse order is also possible.
        "Mod+Shift+R".switch-preset-column-width-back = {};

        "Mod+Ctrl+Shift+R".switch-preset-window-height = {};
        "Mod+Ctrl+R".reset-window-height = {};

        "Mod+F".maximize-column = {};
        "Mod+Shift+F".fullscreen-window = {};

        # While maximize-column leaves gaps and borders around the window,
        # maximize-window-to-edges doesn't: the window expands to the edges of the screen.
        # This bind corresponds to normal window maximizing,
        # e.g. by double-clicking on the titlebar.
        "Mod+M".maximize-window-to-edges = {};

        # Expand the focused column to space not taken up by other fully visible columns.
        # Makes the column "fill the rest of the space".
        "Mod+Ctrl+F".expand-column-to-available-width = {};

        "Mod+C".center-column = {};

        # Center all fully visible columns on screen.
        "Mod+Ctrl+C".center-visible-columns = {};

        "Mod+Minus".set-column-width = "-10%";
        "Mod+Equal".set-column-width = "+10%";

        # Finer height adjustments when in column with other windows.
        "Mod+Shift+Minus".set-window-height = "-10%";
        "Mod+Shift+Equal".set-window-height = "+10%";

        # Move the focused window between the floating and the tiling layout.
        "Mod+V".toggle-window-floating = {};
        "Mod+Shift+V".switch-focus-between-floating-and-tiling = {};

        # Toggle tabbed column display mode.
        # Windows in this column will appear as vertical tabs,
        # rather than stacked on top of each other.
        "Mod+W".toggle-column-tabbed-display = {};

        "Print".screenshot = {};
        "Ctrl+Print".screenshot-screen = {};
        "Alt+Print".screenshot-window = {};

        "Mod+Escape" = {
          _props.allow-inhibiting = false;
          toggle-keyboard-shortcuts-inhibit = {};
        };

        # The quit action will show a confirmation dialog to avoid accidental exits.
        "Mod+Shift+E".quit = {};
        "Ctrl+Alt+Delete".quit = {};

        # Powers off the monitors. To turn them back on, do any input like
        # moving the mouse or pressing any other key.
        "Mod+Shift+P".power-off-monitors = {};
      };
    };
  };
}
