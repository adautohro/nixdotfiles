{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    inputs.zen-browser.homeModules.beta
    ./niri.nix
    ./nvf.nix
    ./noctalia.nix
  ];

  home.username = "adautohro";
  home.homeDirectory = "/home/adautohro";

  home.preferXdgDirectories = true;
  home.stateVersion = "26.05";

  # targets.genericLinux.enable = true; # Non NixOS

  fonts.fontconfig.enable = true; # Manage system fonts

  #Packages that should be installed in the user profile
  home.packages = with pkgs; [
    bitwarden-desktop
    heroic
    fastfetch
    mangohud
    fd
    ripgrep
    cine
    qimgv
    decibels
    mission-center
    snapshot
    opencpn
    localsend
    kdePackages.okular
    bibata-cursors
    gtk3
    nerd-fonts.jetbrains-mono
  ];


  # Add the support to the default user directories on XDG system
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
  };

  # Manage the wallpapers
  home.file = {
    "${config.xdg.userDirs.pictures}/wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };
  };

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Original-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  #Let home-manager install and manage itself
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user.name = "Adauto H. R. de Oliveira";
      user.email = "112290445+adautohro@users.noreply.github.com";

      alias = {
        s = "status --short";
        l = "log --graph --pretty --abbrev-commit";
        cm = "commit --message";
        aa = "add --all";
      };

      init.defaultBranch = "main";
    };
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    extraConfig = ''
      include themes/noctalia.conf
    '';
    settings = {
      background_opacity = "0.85";
      background_blur = 1; # 1 to 64
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

  programs.calibre = {
    enable = true;
  };

  programs.sioyek = {
    enable = true;
  };

  programs.zoxide.enable = true;
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zed-editor = {
    enable = true;
  };

  programs.firefox = {
    enable = false;
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

      ExtensionSettings = {
        "{3c078156-979c-498b-8990-85f7987dd929}" = {
          # Sidebery
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sidebery/latest.xpi";
        };
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
          # Bitwarden
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
        };
      };

    };

    profiles.default = {
      id = 0;
      name = "default";
      path = "default";
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.uidensity" = 0;
        "svg.context-properties.content.enabled" = true;
        "sidebar.visibility" = "always-show";
      };
    };

  };

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

}
