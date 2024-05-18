{ config, lib, pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
      userName = "basalt79";
      userEmail = "aigner.georg.79@gmail.com";
    };
  };
}
