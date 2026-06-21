# Neovim: config completa + templates ASP.NET
# La config se maneja en nvim/ (se symlinkea a ~/.config/nvim)
{ config, pkgs, ... }:

let
  repo = "${config.home.homeDirectory}/nix-config";
in {
  # Symlink completo de la config de Neovim
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${repo}/nvim";

  # Templates de proyectos ASP.NET (.editorconfig, .gitattributes, etc.)
  home.file.".config/nvim/templates/dotnet/.editorconfig".source =
    "${repo}/templates/.editorconfig";
  home.file.".config/nvim/templates/dotnet/.gitattributes".source =
    "${repo}/templates/.gitattributes";
  home.file.".config/nvim/templates/dotnet/.gitignore".source =
    "${repo}/templates/.gitignore";
  home.file.".config/nvim/templates/dotnet/Directory.Build.props".source =
    "${repo}/templates/Directory.Build.props";
  home.file.".config/nvim/templates/dotnet/global.json".source =
    "${repo}/templates/global.json";
  home.file.".config/nvim/templates/dotnet/new-aspnet.sh".source =
    "${repo}/templates/new-aspnet.sh";
  home.file.".config/nvim/templates/dotnet/verify-crossplatform.sh".source =
    "${repo}/templates/verify-crossplatform.sh";
}
