{ config, lib, pkgs, ... }:

{


nixpkgs.config.allowUnfree = true;

programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    bbenoist.nix
    github.github-vscode-theme
  ];


  userSettings = {
    "editor.tabSize" = 2;
    "editor.mouseWheelZoom" = true;
    "editor.insertSpaced" = true;
    "workbench.colorTheme" =  "GitHub Dark Default";
  };
};

}
