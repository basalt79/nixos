{ config, lib, pkgs, ... }:

{
  programs = {
    bash = {
      enable = true;
      shellAliases = {
        la = "ls -lha";
        ll = "ls -l";
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
      };
    };
  };
}
