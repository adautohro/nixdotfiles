{ config, pkgs, ... }:
{
programs.noctalia = {

  enable = true;

  settings = {

    theme = {
      mode = "dark";
      source = "wallpaper";
      builtin = "m3-content";
      pure_black_dark = false;
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
      };
    };

    dock = {
      enabled = true;
      auto_hide = true;
      smart_auto_hide = true;
      shadow = true;
      magnification = true;
      pinned = [ ];
      position = "bottom";
      show_instance_count = true;
      show_dots = true;
      show_running = true;
    };
    
    hot_corners = {
      enabled = false;
    };

    wallpaper = {
      enabled = true;
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
	  timeout = 660.0;
	};
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

  shell = {
    app_icon_colorize = false;
    font_family = "Adwaita Sans";
    lang = "pt-BR";
    niri_overview_type_to_launch_enabled = true;
    screen_time_enabled = true;
    settings_window_translucent = false;
    telemetry_enabled = true;

    launcher = {
      app_grid = false;
      categories = true;
      sort_by_usage = true;
      compact = false;
      pinned = [ ];
    };

  };
}; 

}
