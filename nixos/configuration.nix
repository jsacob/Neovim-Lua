  #------------------------------------------------------------------------------

  { config, pkgs, ... }:
  let
  # sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
  # sudo nix-channel --update
  unstable = import <nixos-unstable> {
    config = { allowUnfree = true; };
  };
in
  {
   services.flatpak.enable = true;

  #------------------------------------------------------------------------------
  
  # Docker
  virtualisation.docker.enable = true;

  programs.hyprland ={
  	enable = true;
	xwayland.enable = true;
  };
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  users.defaultUserShell = pkgs.zsh;

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];	

  #------------------------------------------------------------------------------

programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};
  #------------------------------------------------------------------------------

  # Nvidia
 services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
    dynamicBoost.enable = true;
    prime = {
      reverseSync.enable = true;
      offload = {
        enable = false;
        enableOffloadCmd = true;
      };
      sync.enable = false;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  #------------------------------------------------------------------------------

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #------------------------------------------------------------------------------

  # Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  #------------------------------------------------------------------------------

  # Network
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
 
  #------------------------------------------------------------------------------

  # System Settings
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  #------------------------------------------------------------------------------

  # Personal (local) Packages
  users.users.jacob = {
    isNormalUser = true;
    description = "jacob";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  users.users.lily = {
    isNormalUser = true;
    description = "jacob";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [longcat neofetch];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  #------------------------------------------------------------------------------

  # System (global) Packages
  environment.systemPackages = with pkgs; [

  #code
  neovim
  git
  tmux
  gh
  python312
  pkg-config
  luarocks # (Lazyvim)
  pkgs.vimPlugins.nvim-treesitter
  stylua # (LazyVim)
  fzf #Fuzzy Finder (LazyVim)
  nodejs_22
  bun
  cargo
  rustup
  rustlings
  gnumake
  timer
  jdk21
  kitty
  sutils
  tree-sitter
  # llvmPackages_21.libcxxClang
  # llvmPackages_21.clang
  # llvmPackages_21.clang-tools
  binutils
  flatpak
  alacritty
  zsh
  nixfmt

  #System
  fish # Shell
  brightnessctl # Controls Brightness
  unzip # Unzip packages
  wl-clipboard # For automatically copying whole files  
  tofi # Search tool
  playerctl # Music Player for keys
  dunst # Notification daemon
  xdg-utils # command-line utilites
  hyprpaper # Hyprland wallpaper manager
  wayland 
  wayland-protocols
  wineWowPackages.waylandFull #For running window applications on Linux
  usbutils #Collection of tools for interacting with USB devices
  atop # Resource monitoring tool 
  gthumb # Image viewer
  nvtopPackages.nvidia # For Nvidia
  openssl
  grimblast # Screenshot tool
  util-linux # Utils for Linux
  bat
  imgcat
  
  #personal
  firefox
  vesktop 
  nix-search-cli
  godot
  steam

  #C++ tools
  llvmPackages_21.libcxx      # The C++ standard library (libc++)
  llvmPackages_21.clang       
  llvmPackages_21.libcxxClang # The Clang wrapper that knows about libc++
  llvmPackages_21.clang-tools
  ];
  


  #------------------------------------------------------------------------------
# Set cursor theme and size globally for XWayland and Wayland apps
  environment.variables = {
    XCURSOR_THEME = "HyprBibataModernClassicSVG";  # Cursor theme for XWayland apps
    XCURSOR_SIZE = "24";  # Cursor size for XWayland apps
    HYPRCURSOR_THEME = "HyprBibataModernClassicSVG";  # Cursor theme for Wayland apps (Hyprland)
    HYPRCURSOR_SIZE = "24";  # Cursor size for Wayland apps (Hyprland)
  };

 
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  services.pipewire = {
     enable = true;
     audio.enable = true;
     extraConfig.pipewire = {
       "context.modules" = [
         { name = "libpipewire-module-bluez5"; args = { "a2dp.force-a2dp" = true; }; }
       ];
     };
   };

}

  #------------------------------------------------------------------------------
