# Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Networking and internet
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";
  networking.wireless.enable = true;
  networking.firewall.enable = true;

  time.timeZone = "America/Fortaleza";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = [ "xdg-desktop-portal-gtk" ];

  services.dbus.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.accounts-daemon.enable = true;

  services.displayManager.regreet = {
    enable = true;
  };
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "abnt2";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Hardware
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false; # Enable Bluetooth on boot
  hardware.graphics.enable = true; # Enable GPU acceleration
  hardware.graphics.enable32Bit = true;

  # Graphics Driver
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Battery
  services.tlp = {
    enable = true; # Power manager for laptops
    pd.enable = true; # power-profiles-daemon compatibility
  };
  services.upower.enable = true; # Dbus interface for power managers

  services.libinput.enable = true; # Enable touchpad support

  nix.settings.auto-optimise-store = true; # Remove unnecessary store file copies

  # Auto clean old system snapshots
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."adautohro" = {
    isNormalUser = true;
    description = "Adauto Henrique Roseo de Oliveira";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh; # User default shell
  };

  # Programs
  programs.niri = {
    enable = true;
  };
  # programs.ladybird.enable = true;
  programs.firefox.enable = true;
  programs.zsh.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
    xdg-utils
    playerctl # Media player buttons support
    papirus-icon-theme
    adwaita-icon-theme
    hicolor-icon-theme
  ];

  services.xserver.desktopManager.runXdgAutostartIfNone = true;

  # Graphics aceleration

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable support for flatpak
  services.flatpak.enable = true;

  # BEWARE Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05";
}
