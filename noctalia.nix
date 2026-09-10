{ inputs, config, pkgs, ... }:
{
imports = [
    inputs.noctalia.homeModules.default
];


programs.noctalia = {

  enable = true;

  settings = {

    theme = {
      mode = "dark";
      source = "wallpaper";
      builtin = "m3-content";
      pure_black_dark = false;

      templates = {
        builtin_ids = [ "niri" "starship" "kitty" ];
       	community_ids = [ ];
       	niri-theme = {
     	  input_path = "~/.config/noctalia/templates/niri.kdl";
     	  output_path = "~/.config/niri/colors.kdl";
        };
      };
    };

    backdrop = {
      enabled = true;
    };

    calendar = {
      enabled = true;
    };

    bar = {
      order = [ "default" ];

      default = {
        enabled = true;
        auto_hide = false;
     	  smart_auto_hide = false;
     	  show_on_worspace_switch = true;
     	  shadow = true;
        start = ["group:g1" "sysmon" "spacer_2" "group:g2"];
       	center = ["workspaces"];
       	end = ["notes" "clipboard" "audio_visualizer" "media" "group:g4" "group:g5" "control-center" "group:g3"];
       	widget_spacing = 4;

       	capsule_group = [
       	  {
       	    enabled = true;
       	    id = "g3";
       	    members = [ "battery" "session"];
       	    widget_spacing = 8;
       	  }
       	  {
       	    enabled = true;
       	    id = "g1";
       	    members = ["launcher" "wallpaper" "wallhaven"];
       	  }
       	  {
       	    enabled = true;
       	    id = "g4";
       	    members = [ "network" "bluetooth" ];
       	  }
       	  {
       		 enabled = true;
               	fill = "surface_variant";
               	id = "g5";
               	members = [ "volume" "brightness" ];
       	  }
       	  {
           	        enabled = true;
                   	fill = "surface_variant";
               	id = "g2";
               	members = [ "date" "clock" "notifications" ];
        		widget_spacing = 13;
       	  }
       	];

      };
    };

    dock = {
      auto_hide = false;
      border = "on_surface";
      concave_edge_corners = false;
      enabled = true;
      icon_size = 43;
      item_spacing = 9;
      magnification = true;
      main_axis_padding = 13;
      margin_edge = 9;
      pinned = [ "zen-beta" "yazi" "steam" "com.heroicgameslauncher.hgl" "kitty"];
      position = "bottom";
      reserve_space = false;
      shadow = true;
      show_dots = true;
      show_instance_count = true;
      show_running = true;
      smart_auto_hide = true;
    };

    hot_corners = {
      enabled = false;
    };

    plugins.enabled = ["noctalia/wallhaven" "noctalia/notes"];

    wallpaper = {
      enabled = true;
      directory = "${config.xdg.userDirs.pictures}/wallpapers";
      transition_on_startup = true;
      automation.enabled = false;
    };

    idle = {
      behavior = {
        lock = {
     	    enabled = true;
     	    timeout = 600.0;
       	};
        lock-and-suspend = {
     	    enabled = true;
     	    timeout = 900.0;
       	};
        screen-off = {
       	  enabled = true;
       	  timeout = 659.0;
       	};
      };
    };




  nightlight = {
    enabled = true;
    temperature_night = 4000; #The lower the warmer
  };

  location = {
     address = "Fortaleza,Brazil";
  };

  lockscreen = {
    enabled = true;
    blurred_desktop = true;
    lock_before_suspend = true;
  };

  widget = {
    audio_visualizer = {
      bands = 84;
      centered = false;
      color_2 = "tertiary";
      mirrored = false;
      scale = 1.25;
      width = 84;
    };

    media = {
      hide_when_no_media = true;
      max_length = 157;
      show_progress = true;
      title_scroll = "on_hover";
    };
    network = {
      show_label = false;
    };

    notifications = {
      hide_when_no_unread = true;
    };

    spacer_2 = {
      length = 24;
      type = "spacer";
    };

    notes = {
      type = "noctalia/notes:notes";
    };

    wallhaven = {
      type = "noctalia/wallhaven:wallhaven";
    };

    sysmon = {
      stat = "ram_pct";
    };

    volume = {
      show_label = false;
    };

    workspaces = {
      hide_when_empty = true;
      pill_scale = 0.7;
      show_labels = false;
    };
  };

  shell = {
    app_icon_colorize = false;
    font_family = "JetBrainsMono Nerd Font";
    lang = "pt-br";
    niri_overview_type_to_launch_enabled = true;
    screen_time_enabled = true;
    settings_window_translucent = false;
    telemetry_enabled = true;
    polkit_agent = true;
    screen_corners.enabled = true;

    launcher = {
      app_grid = false;
      categories = true;
      sort_by_usage = true;
      compact = false;
      pinned = [ ];
    };

    greeter_sync.auto_sync = true;

    };
  };
};


}
