{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  buildInputs = with pkgs; [ curl morph ];
  SSH_IDENTITY_FILE = "~/.ssh/bw";
}
