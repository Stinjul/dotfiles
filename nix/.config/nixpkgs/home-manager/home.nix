{ inputs, config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "stinjul";
    homeDirectory = "/home/stinjul";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.k6
    pkgs.jmeter
    pkgs.elixir_ls
    pkgs.talosctl
    pkgs.rnix-lsp
    pkgs.ccemux
    pkgs.prismlauncher
	pkgs.nixgl.nixGLIntel
	pkgs.apache-directory-studio
	pkgs.avalonia-ilspy
	pkgs.devspace
	pkgs.starsector
  ];
}
