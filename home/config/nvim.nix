{ config, pkgs, ... }:

{
  home.file.".config/nvim".source = ../../nvim;

  home.file.".config/nvim/templates/dotnet/.editorconfig".source =
    ../../templates/.editorconfig;
  home.file.".config/nvim/templates/dotnet/.gitattributes".source =
    ../../templates/.gitattributes;
  home.file.".config/nvim/templates/dotnet/Directory.Build.props".source =
    ../../templates/Directory.Build.props;
  home.file.".config/nvim/templates/dotnet/global.json".source =
    ../../templates/global.json;
  home.file.".config/nvim/templates/dotnet/new-aspnet.sh".source =
    ../../templates/new-aspnet.sh;
  home.file.".config/nvim/templates/dotnet/verify-crossplatform.sh".source =
    ../../templates/verify-crossplatform.sh;
}
