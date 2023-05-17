{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.llamagptjchat = {
    url = "https://github.com/kuvaus/LlamaGPTJ-chat";
    flake = false;
    submodules = true;
    type = "git";
  };

  outputs = { self, nixpkgs, llamagptjchat }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.${system} = {
      llamagptj-chat = pkgs.callPackage ./llamagptj-chat.nix { src=llamagptjchat; };
      default = self.packages.${system}.llamagptj-chat;
    };

    apps.${system} = {
      default = {
        type = "app";
        program = "${self.packages.${system}.llamagptj-chat}/bin/chat";
      };
    };
  };
}
