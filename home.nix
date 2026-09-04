{inputs, config, pkgs, ... }:

{
  home.username = "adautohro";
  home.homeDirectory = "/home/adautohro";

  home.stateVersion = "26.05";

  fonts.fontconfig.enable = true;

  #Packages that should be installed in the user profile
  home.packages = with pkgs; [
     fastfetch
     nerd-fonts.jetbrains-mono
  ];
  
  #Let home-manager install and manage itself
  programs.home-manager.enable = true;


  programs.neovim.enable = true;
  programs.kitty = {
    enable = true;
    font = {
      name = "JetbrainsMono Nerd Font";
      size = 12;
    };
    settings = {
      background_opacity = "0.85";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 1000;

    initContent = ''
	fastfetch
    '';
  };

  programs.git = {
   enable = true;
   settings = {
   };
  };
 
  programs.firefox = {
    enable = true;
    policies = {
      DisableFirefoxScreenshots = true;
      DontCheckDefaultBrowser = true;
      UserMessaging = {
        ExtensionRecommendations = false;
	UrlbarInterventions = false;
	MoreFromMozilla = false;
      };
      FirefoxSuggest = {
        WebSuggestions = false;
	SponsoredSuggestions = false;
	ImproveSuggest = false;
	Locked = true;
      };
    };
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      settings = {
        
      };
    };
  };

  imports = [ inputs.noctalia.homeModules.default inputs.zen-browser.homeModules.beta ./niri.nix ];
  programs.zen-browser = {
    enable = true; 
    setAsDefaultBrowser = true;

    profiles.default = { 
      id = 0;
      name = "default";
      isDefault = true;

      settings = {
        "zen.ui.migration.compact-mode-button-added" = true;
	"zen.view.compact-mode" = true;
	"zen.view.compact.enable-at-startup" = true;
	"zen.view.compact.hide-tabbar" = true;
	"zen.view.compact.hide-toolbar" = true;
	"zen.view.single-toolbar" = false;
	"zen.view.use-single-toolbar" = false;
	"zen.welcome-screen.seen" = true;
	"zen.workspaces.continue-where-left-off" = true;
	"browser.ctrlTab.recentlyUsedOrder" = true;
	"browser.ctrlTab.SortByRecentlyUsed" = true;
	"intl.locale.requested" = "pt-BR,en-US";
      };

      mods = [
       "c01d3e22-1cee-45c1-a25e-53c0f180eea8" # Ghost Tabs
       "a6335949-4465-4b71-926c-4a52d34bc9c0" # Better Find Bar
      ];

      pinsForce = true;
      pinsForceAction = "demote";
      pins = {
        "Spotify" = {
	  id = "spotify-essential";
	  url = "https://open.spotify.com/";
	  isEssential = true;
	};

	"Github" = {
	  id = "github-essential";
	  url = "https://github.com/";
	  isEssential = true;
	};

	"Whatsapp" = {
	  id = "whatsapp-essential";
	  url = "https://whatsapp.com";
	  isEssential = true;
	};
      };
    };

    policies = {
      DontCheckDefaultBrowser = true;
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
	   installation_mode = "force_installed";
	   install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
	   private-browsing = true;
	};
        "addon@darkreader.org" = {
	   installation_mode = "force_installed";
	   install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
	};
	"{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
	   installation_mode = "force_installed";
	   install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
	};
      };
    };


  };

  programs.noctalia = {
   enable = true;
   settings = {
    theme = {
      mode = "dark";
      source = "wallpaper";
      builtin = "m3-content";
    };
    interface = {
      font.family = "Adwaita Sans";
      language = "auto";
    };
    backdrop = {
      enabled = true;
    };
    calendar = {
     calendar = true;
    };
    location = {
     adress = "Fortaleza,Brazil";
    };
    screen-time.enabled = true;
    dock = {
      enabled = true;
      behaviour = {
        auto-hide = "smart";
        show-dots = true;
        show-running = true;
      };
    };
   wallpaper = {
    enabled = true;
   };
   };
   
  }; 

}
